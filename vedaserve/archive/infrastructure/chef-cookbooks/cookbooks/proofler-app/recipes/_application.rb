cap_user         = node['proofler']['deployment_user']
cap_group        = node['proofler']['deployment_user_group']
app_install_path = node['proofler']['directory']

application "proofler" do
  path app_install_path
  owner cap_user
  group cap_group

  packages [
            'git', # for capistrano
            'build-essential', # to build native gem extensions
            'libssl-dev', # for eventmachine
            'libcurl4-openssl-dev', # for curb
            'libpq-dev' # for postgresql
           ]

  repository "git@github.com:Vedaserve/Proofler.git"
  revision   "production"

  rails do
    precompile_assets true
    bundler true
    bundle_command '/opt/rbenv/shims/bundle' # chef will set the PATH
                                             # variable to first use
                                             # /opt/chef/embedded

    database do
      database "proofler_production"
      username "proofler"
      password "ehdR6BAx0qrLCKW4CxA"
      adapter "postgresql"
    end
    database_master_role "proofler_database_master"
  end
end

directory "#{app_install_path}/shared/pids" do
  user cap_user
  group cap_group
  mode 0755
  action :create
end

directory "#{app_install_path}/shared/log" do
  user cap_user
  group cap_group
  mode 0755
  action :create
end
