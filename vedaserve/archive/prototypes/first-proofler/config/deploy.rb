# -*- coding: utf-8 -*-
require 'bundler/capistrano'
load 'lib/deploy/seed'

default_run_options[:pty] = true
set :default_shell, "bash -l"

set :bundle_cmd, "chruby-exec 2.0 -- bundle"

# Application config
set :application, "proofler"
set :server_ip, "37.72.147.6"
set :user,    "railsvm"
set :scm, :git
set :git_enable_submodules, 1
set :repository, "git@github.com:Vedaserve/Proofler.git"
set :branch,      "production"

# Deployment Einstellungen
set :use_sudo, false
set :keep_releases, 2
set :deploy_to, "/usr/local/nginx/html/"

# Roles
role :web, server_ip
role :app, server_ip
role :db,  server_ip, :primary => true

namespace :deploy do
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

namespace :custom do
  task :reset do
    run "cd #{current_path} && bundle exec rake db:reset RAILS_ENV=#{rails_env}"
  end
end
