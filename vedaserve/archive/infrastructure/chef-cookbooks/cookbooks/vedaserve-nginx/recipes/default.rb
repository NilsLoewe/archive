node.override['nginx']['user'] = node['vedaserve-nginx']['user']

include_recipe 'nginx::default'

cookbook_file "#{node['vedaserve-nginx']['dir']}/htpasswd" do
  source "htpasswd"
  owner "root"
  group "root"
  mode 00644
end

template "#{node['vedaserve-nginx']['dir']}/sites-available/default" do
  source "nginx-site.erb"
  owner "root"
  group "root"
  mode 00644
  variables({})
  notifies :reload, 'service[nginx]'
end
