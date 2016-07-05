node.override['chef_client']['init_style'] = 'init'

include_recipe 'chef-client::default'
