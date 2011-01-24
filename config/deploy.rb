set :user, 'adam'

set :application, "kreditmarket.com"

role :app, "kreditmarket.com"
role :web, "kreditmarket.com"
role :db,  "kreditmarket.com", :primary => true

set :scm, "git"
set :repository,  "git@github.com:kreditmarket/kreditmarket.com.git"
set :deploy_via, :remote_cache

ssh_options[:forward_agent] = true
default_run_options[:pty] = true

set :keep_releases, 10
set :use_sudo, false

set :branch, "master"
set :deploy_to, "/home/#{user}/webapps/#{application}"

namespace :deploy do
  desc "Restart application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

after "deploy", "deploy:cleanup"