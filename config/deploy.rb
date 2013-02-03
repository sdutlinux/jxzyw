require 'bundler/capistrano'
require 'rvm/capistrano'

set :rvm_type, :system 
set :rvm_ruby_string, 'ruby-1.9.3-p327@jxzyw'

server "rails@210.44.176.241", :app, :web, :db, :primary => true
set :port, 80

set :application, "jxzyw"
set :repository,  "git://github.com/jwch/teaching.git"
set :scm, :git
set :branch, "master"
set :use_sudo, false
set :keep_releases, 3
set :bundle_without, [:development,:test]

set :deploy_to, "/home/rails/#{application}"

#
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

#  desc "Symlinks the database.rb"
#  task :symlink_db, :roles => :app do
#    run "ln -nfs #{deploy_to}/shared/config/database.rb #{release_path}/config/database.rb"
#  end

  desc "init db"
  task :init_db, :roles => :db do
    run "cd #{deploy_to}/current/; bundle exec rake ar:create PADRINO_ENV=production"
    run "cd #{deploy_to}/current/; bundle exec rake ar:migrate PADRINO_ENV=production"
  end

  desc "recovery data"
  task :recovery_data, :roles => :db  do
    run "cd #{deploy_to}/current/; bundle exec rake init:sections  PADRINO_ENV=production"
    run "cd #{deploy_to}/current/; bundle exec rake init:categories PADRINO_ENV=production"
    run "cd #{deploy_to}/current/; bundle exec rake recovery:all  PADRINO_ENV=production"
  end
end

#after 'bundle:install', 'deploy:init_db', 'deploy:recovery_data'
after "deploy:restart", "deploy:cleanup"
