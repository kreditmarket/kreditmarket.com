require 'thinking_sphinx/deploy/capistrano'

set :user, 'kreditmarket'

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

# Thinking Sphinx
task :before_update_code, :roles => [:app] do
  thinking_sphinx.stop
end

task :after_update_code, :roles => [:app] do
  symlink_sphinx_indexes
  thinking_sphinx.configure
  thinking_sphinx.start
end

task :symlink_sphinx_indexes, :roles => [:app] do
  run "ln -nfs #{shared_path}/db/sphinx #{release_path}/db/sphinx"
end

after "deploy", "deploy:cleanup"