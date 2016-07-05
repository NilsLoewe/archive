include_recipe "vedaserve-ruby::default"
include_recipe "proofler-app::_deploy_user"
include_recipe "proofler-app::_application"
include_recipe "proofler-app::_thin"

node.override['vedaserve-nginx']['user'] = node['proofler']['deployment_user']
include_recipe "vedaserve-nginx::default"
