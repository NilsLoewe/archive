# The Vagrant Ubuntu 10.04 box has a default locale setting
# of `en_US`, which causes the template database to require
# LATIN1 enconding. Setting the environment variables, before
# postgres gets installed, fixes this issue.
ENV['LANGUAGE'] = ENV['LANG'] = ENV['LC_ALL'] = "en_US.UTF-8"

node.override['postgresql']['listen_addresses'] = node['vedaserve-postgresql']['listen_addresses']
node.override['postgresql']['pg_hba']           = node['vedaserve-postgresql']['pg_hba']

include_recipe "postgresql::server"
include_recipe "postgresql::client"

node['vedaserve-postgresql']['users'].each do |user|
  p = user["privileges"]
  pg_user user["name"] do
    password   user["password"]
    privileges :superuser => p["superuser"], :createdb => p["createdb"], :login => p["login"]
  end
end

node['vedaserve-postgresql']['databases'].each do |db|
  pg_database(db[:name]) do
    owner    db[:owner]
    encoding db[:encoding]
    template db[:template]
    locale   db[:locale]
  end
end
