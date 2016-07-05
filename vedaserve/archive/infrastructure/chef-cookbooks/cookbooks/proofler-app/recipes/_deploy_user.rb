cap_user      = node['proofler']['deployment_user']
cap_group     = node['proofler']['deployment_user_group']
cap_user_home = node['proofler']['deployment_user_home']

group cap_group

user cap_user do
  comment "deployment user"
  home cap_user_home
  gid cap_group
  shell '/bin/bash'
  system true
  supports :manage_home => true

  action :create
end

directory "#{cap_user_home}/.ssh" do
  owner cap_user
  group cap_group
  mode 00700
  action :create
end

cookbook_file "#{cap_user_home}/.ssh/id_rsa" do
  source "deploy_key"
  owner cap_user
  group cap_group
  mode 00400
end

cookbook_file "#{cap_user_home}/.ssh/authorized_keys" do
  source "authorized_keys"
  owner cap_user
  group cap_group
  mode 00600
end

cookbook_file "#{cap_user_home}/.ssh/known_hosts" do
  source "known_hosts"
  owner cap_user
  group cap_group
  mode 00600
end
