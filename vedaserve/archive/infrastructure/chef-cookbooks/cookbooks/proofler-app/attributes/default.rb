default['proofler']['deployment_user']       = 'deploy'
default['proofler']['deployment_user_home']  = '/home/deploy'
default['proofler']['deployment_user_group'] = 'deploy'
default['proofler']['directory']             = '/app/proofler'
default['proofler']['thin_pid']              = "#{node['proofler']['directory']}/shared/pids/thin.pid"
