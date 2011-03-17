set :user, 'kreditmarket'

set :application, "perfectcash"

role :app, "xn--80ajbjcodnbdc2czdg8ch.xn--p1ai"
role :web, "xn--80ajbjcodnbdc2czdg8ch.xn--p1ai"
role :db,  "xn--80ajbjcodnbdc2czdg8ch.xn--p1ai", :primary => true

set :scm, "git"
set :repository,  "git@github.com:kreditmarket/kreditmarket.com.git"
set :deploy_via, :remote_cache

ssh_options[:forward_agent] = true
default_run_options[:pty] = true

set :keep_releases, 10
set :use_sudo, false

set :branch, "perfectcash"
set :deploy_to, "/home/#{user}/webapps/#{application}"

namespace :deploy do
  desc "Restart application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

after "deploy", "deploy:cleanup"