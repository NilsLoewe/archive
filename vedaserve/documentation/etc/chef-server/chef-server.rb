# Reference: http://docs.opscode.com/config_rb_chef_server.html

server_name = 'ci.vedaserve.de'

nginx['ssl_port']    = 9443                          # default 443
nginx['server_name'] = server_name                   # default node['fqdn']
nginx['url']         = "https://#{server_name}:9443" # default https://#{node['fqdn']}
nginx.merge!(
  ssl_country_name:             'DE',
  ssl_state_name:               'Hamburg',
  ssl_locality_name:            'Hamburg',
  ssl_company_name:             'Vedaserve GmbH',
  ssl_organizational_unit_name: 'Operations',
  ssl_email_address:            'ops@vedaserve.de'
)

# use the systems PostgreSQL server
postgresql['enable'] = false # default true

postgresql['sql_user']     = 'opscode_chef' # default opscode_chef
postgresql['sql_password'] = 'snakepliskin' # default snakepliskin

postgresql['sql_ro_user']     = 'opscode_chef_ro' # default opscode_chef_ro
postgresql['sql_ro_password'] = 'shmunzeltazzen'  # default shmunzeltazzen

lb['api_fqdn']    = server_name # default node['fqdn']
lb['web_ui_fqdn'] = server_name # default node['fqdn']
