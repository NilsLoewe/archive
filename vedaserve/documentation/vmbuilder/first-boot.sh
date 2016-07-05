# Fix locale
echo 'LANGUAGE="en_US.UTF-8"' >> /etc/default/locale
echo 'LC_ALL="en_US.UTF-8"' >> /etc/default/locale

# Configure guest to use the host's apt-cacher-ng
#echo 'Acquire::http::Proxy "http://144.76.101.52:3142";' > /etc/apt/apt.conf.d/01proxy

chmod 600 /home/chef/.ssh/authorized_keys

curl -L https://www.opscode.com/chef/install.sh | sudo bash
sudo chef-client -j /etc/chef/chef-bootstrap.json
