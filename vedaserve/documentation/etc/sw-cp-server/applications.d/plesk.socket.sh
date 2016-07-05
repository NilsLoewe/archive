#!/bin/sh

USAGE="Usage: $0 <port> [ipv6] [ssl]"

if [ -z "$1" ]; then
    echo $USAGE 1>&2
    exit 1
fi

PORT="$1"
shift

IPV6="no"
SSL="no"


if [ "$1" = "ipv6" ] ; then
    IPV6="yes"
    shift
fi

if [ "$1" = "ssl" ] ; then
    SSL="yes"
    shift
fi

if [ -n "$1" ] ; then
    echo "Unknown extra args: $@" 1>&2
    echo $USAGE 1>&2
    exit 1
fi


# Checking IPv6 into system status:
IPV6_SOCKET="no"

# TODO: adaptation for FreeBSD
if [ -f /proc/net/if_inet6 ] ; then
    IPV6_SOCKET="only"

    # is IPv6 socket accepts IPv4 connections?
    if [ "X`/sbin/sysctl -n -e net.ipv6.bindv6only`" = "X0" ] ; then
        IPV6_SOCKET="yes"
    elif [ -d "/proc/vz" ] ; then
        # Bind only v6 under Virtuozzo
        IPV6_SOCKET="yes"
    fi
fi

# IPv6 is not supported by OS settings.
if [ $IPV6 = "yes" -a $IPV6_SOCKET = "no" ] ; then
    exit 0
fi

# In that case IPv6 socket can server IPv4 clients,
# so IPv4 section not needed at all
if [ $IPV6 = "no" -a $IPV6_SOCKET = "yes" ] ; then
    exit 0
fi

SOCK="/opt/psa/tmp/sw-engine"
if [ $PORT != "8443" ] ; then
    SOCK="$SOCK-$PORT"
fi
if [ $IPV6_SOCKET = "only" ] ; then
    SOCK="$SOCK-ipv6"
fi
SOCK="$SOCK.sock"


if [ $IPV6_SOCKET = "only" -a $IPV6 = "yes" ] ; then
    cat <<EOF
\$SERVER["socket"] == "[::]:$PORT" {
EOF
else
    cat <<EOF
\$SERVER["socket"] == ":$PORT" {
EOF
fi


if [ $IPV6 = "yes" ] ; then
cat <<EOF
    server.use-ipv6 = "enable"
EOF
fi

if [ $SSL = "yes" ] ; then
cat <<EOF
    \$HTTP["useragent"] =~ "(.*AppleWebKit.*)|(.*MSIE [456]\..*)" {
        server.max-keep-alive-requests = 0
    }
    include_shell "/opt/psa/admin/conf/ssl-conf.sh"
EOF
else
cat <<EOF
    \$HTTP["useragent"] =~ ".*AppleWebKit.*" {
        server.max-keep-alive-requests = 0
    }
EOF
fi

cat <<EOF
    index-file.names = ("index.php")
    server.document-root = "/opt/psa/admin/htdocs"
    accesslog.filename = "/opt/psa/admin/logs/httpsd_access_log"
    mimetype.assign += (".png"  => "image/png",
                        ".jpg"  => "image/jpeg",
                        ".jpeg" => "image/jpeg",
                        ".gif"  => "image/gif",
                        ".html" => "text/html",
                        ".htm" => "text/html",
                        ".js" => "text/javascript",
                        ".css"  => "text/css",
                        ".xml" => "text/xml")
    fastcgi.map-extensions += ( ".php3" => ".php" )
    fastcgi.server += (
	".php" => (
	    (
		"socket" => "$SOCK",
		"bin-path" => "/usr/bin/sw-engine-cgi -c /opt/psa/admin/conf/php.ini -d auto_prepend_file=auth.php3 -u psaadm",
		"bin-username" => "root",
		"max-procs" => 1,
		"min-procs" => 0,
		"idle-timeout" => 60,
		"broken-scriptfilename" => "enable",
		"allow-x-send-file" => "enable",
		"bin-environment" => (
		    "PATH" => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
		    "PHP_FCGI_CHILDREN" => "3",
		    "PHP_FCGI_MAX_REQUESTS" => "10"
		),
	    )
	)
    )
    alias.url += (
        "/sitebuilder/skins/branding" => "/opt/psa/var/branding/sb/skins",
        "/sitebuilder" => "/usr/local/sb/htdocs",
    )
    url.rewrite-once += ("^/plesk/([^\\\\?]*)(\\?(.*))?" => "/plesk.php?\$3"
			, "^/sitepreview/(.*)?" => "/sitepreview.php/\$1"
			, "^/sso/ui" => "/sso/ui.php"
			, "^/sso/users" => "/sso/users.php"
			, "^/sso/signout" => "/sso/signout.php"
			, "^/sitebuilder/api/(.*)" => "/sitebuilder/index.php/\$1"
			, "^/sitebuilder/((.*)\.(.*))$" => "\$0"
			, "^/sitebuilder/(.*)" => "/sitebuilder/index.php/\$1")

    # Admin panel configuration
    alias.url += (
        "/skins/branding" => "/opt/psa/var/branding/panel/skins",
        "/admin" => "/opt/psa/admin/panel/application/public",
    )
    url.rewrite-once += (
        "^/admin/(styles|scripts|images|externals)/.*" => "\$0",
        "^/admin/(.*)" => "/admin/index.php/admin/\$1"
    )
    \$HTTP["url"] =~ "^/admin/" {
        server.error-handler-404 = "/admin/index.php"
    }

    # End-Client panel configuration
    alias.url += ("/smb" => "/opt/psa/admin/smb/application/public")
    url.rewrite-once += (
        "^/smb/(styles|scripts|images|externals)/.*" => "\$0",
        "^/smb/(.*)" => "/smb/index.php/smb/\$1"
    )
    \$HTTP["url"] =~ "^/smb/" {
        server.error-handler-404 = "/smb/index.php"
    }

    # Billing configuration
    alias.url += (
		"/plesk-billing/app-modernbill-admin" => "/opt/plesk-billing/htdocs/admin/",
		"/plesk-billing/app-modernbill-api" => "/opt/plesk-billing/htdocs/action-api/",
		"/plesk-billing/app-modernbill-client" => "/opt/plesk-billing/htdocs/client/",
		"/plesk-billing/app-modernbill-order" => "/opt/plesk-billing/store/htdocs/",
		"/store" => "/opt/plesk-billing/store/htdocs/",
		"/plesk-billing/lib-themes/default/lib-billing" => "/opt/plesk-billing/lib/lib-themes/default/lib-billing/",
		"/plesk-billing" => "/opt/plesk-billing/htdocs/",
		"/hspc-data" => "/var/opt/hspc-root/data/"
	)
    url.rewrite-once += (
		"^/plesk-billing/plugin/(styles|scripts|images|externals)/.*" => "\$0",
		"^/plesk-billing/plugin/(.*)" => "/plesk-billing/plugin/index.php/plesk-billing/plugin/\$1",
		"^/store/(css|js|images|uploads|themes|sf)/.*" => "\$0",
		"^/store/frontend_dev.php/(.*)" => "/store/frontend_dev.php/\$1",
		"^/store/(.*)" => "/store/index.php/\$1",
		"^/plesk-billing/order/products.php\?.*wwid=(\d+)" => "/store/index.php/entry-point/widget/\$1.html",
		"^/plesk-billing/order/products.php\?.*storeID=(\d+)" => "/store/index.php/entry-point/store/\$1.html",
		"^/plesk-billing/order(/.*)?$" => "/store/index.php/",
		"^/plesk-billing/lib-billing/include/lib-mbapi/remote.php$" => "/plesk-billing/mbapi/remote.php",
		"^/plesk-billing/lib-mbapi/include/modules/gateway/return/(.*)" => "/plesk-billing/gw/\$1"
    )
}

EOF
