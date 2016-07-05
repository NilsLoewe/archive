# TODO: it might make sense to extract this to another cookbook, because the database servers and workers won't need this!

deploy_user = node['proofler']['deployment_user']
deploy_group = node['proofler']['deployment_user_group']
app_directory = node['proofler']['directory']
pid_file = node['proofler']['thin_pid']
current_release = "#{app_directory}/current"

template "#{node['proofler']['directory']}/shared/thin.yml" do
  source 'thin.yml.erb'
  mode   0664
  owner  deploy_user
  group  deploy_group
  variables({
    :pid_file        => pid_file,
    :current_release => current_release
  })
end

link "#{current_release}/thin.yml" do
  to "#{app_directory}/shared/thin.yml"
end

execute "start thin" do
  command "bundle exec thin start -C thin.yml"
  environment "RAILS_ENV" => "production"
  cwd     current_release
  user    deploy_user
  group   deploy_group

  action  :run
  not_if  "ps --no-headers --pid `cat #{pid_file}`"
end
