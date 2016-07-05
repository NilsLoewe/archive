# Capistrano Einstellungen
require "bundler/capistrano"
default_run_options[:pty] = true
set :default_shell, "bash -l"

# App Einstellungen
set :application, "Leo"            # Der Name deiner App.
set :server_ip, "37.72.147.4"            # Deine Railscloud IPv4 Adresse.
set :user, "railsvm"                    # Deployment User
set :git_repo, "git@github.com:NilsLoewe/leo.git"    # z.B.: git@github.com:user/repo.git

# Deployment Einstellungen
set :appdir, "/usr/local/nginx/html/"
set :use_sudo, false
set :keep_releases, 2
set :deploy_to, appdir

# Git / Version Control
set :scm, :git
set :repository, git_repo
set :branch, "master"                  # Branch auswaehlen
set :git_enable_submodules, 1          # Git Submodules ebenfalls fetchen.


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

after "bundle:install" do
  run "cd #{release_path}; RAILS_ENV=production bundle exec rake assets:precompile"
end
