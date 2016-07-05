# please set the following values in your environment (i.e. ~/.bashrc)
chef_user = "#{ENV['CHEF_USER']}"
chef_key  = "#{ENV['CHEF_KEY']}"
ssh_user  = "#{ENV['CHEF_SSH_USER']}"
identity_file = "#{ENV['CHEF_SSH_IDENTITY_FILE']}"

current_dir = File.dirname(__FILE__)

log_level :info
log_location STDOUT

chef_server_url "https://ci.vedaserve.de:9443"

node_name chef_user
client_key chef_key

validation_client_name "chef-validator"
validation_key         "#{current_dir}/validation.pem"

cache_type 'BasicFile'
cache_options(:path => "#{ENV['HOME']}/.chef/checksums")

knife.merge!(
  :ssh_user => "#{ssh_user}",
  :identity_file => "#{identity_file}",
  :run_list => [],
  :use_sudo => true
)
