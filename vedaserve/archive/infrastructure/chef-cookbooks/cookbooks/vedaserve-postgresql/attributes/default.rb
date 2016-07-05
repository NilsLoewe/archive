default['vedaserve-postgresql']['listen_addresses'] = '0.0.0.0'
default['vedaserve-postgresql']['pg_hba']           = [
  {type: 'host', db: 'proofler_production', user: 'proofler', addr: '78.47.79.240/29', method: 'password'}
]
default['vedaserve-postgresql']['users'] = [
  {"name" => 'vagrant',  "password" => 'vagrant',             "privileges" => {"superuser" => false, "createdb" => true, "login" => true}},
  {"name" => 'proofler', "password" => 'ehdR6BAx0qrLCKW4CxA', "privileges" => {"superuser" => false, "createdb" => true, "login" => true}}
]
default['vedaserve-postgresql']['databases'] = [
  {name: 'proofler_production', owner: 'proofler', encoding: 'UTF-8', template: 'template0', locale: 'en_US.UTF-8'}
]
