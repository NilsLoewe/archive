# Installs Ruby using rbenv and sets a global Ruby version

include_recipe 'rbenv::default'
include_recipe 'rbenv::ruby_build'

ruby_version = node['vedaserve-ruby']['version']

rbenv_ruby ruby_version

rbenv_gem "bundler" do
  ruby_version ruby_version
end

rbenv_gem "rake" do
  ruby_version ruby_version
end

rbenv_ruby ruby_version do
  global true
end

execute "allow rbenv group to write rbenv directories" do
  command "chmod g+w -R /opt/rbenv/"
end
