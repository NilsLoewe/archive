current_dir = File.dirname(__FILE__)

log_level :info
log_location STDOUT

chef_server_url "https://ci.vedaserve.de:9443"

validation_client_name "chef-validator"
validation_key         "#{current_dir}/validation.pem"
