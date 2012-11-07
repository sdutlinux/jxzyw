require 'bundler/capistrano'
require 'rvm/capistrano'

set :rvm_type, :system 
set :rvm_ruby_string, 'ruby-1.9.3-p286@jxzyw'

server "rails@210.44.176.208", :app, :web, :db, :primary => true
set :port, 80

set :application, "jxzyw"
set :repository,  "git://github.com/jwch/teaching.git"
set :scm, :git
set :branch, "master"
set :use_sudo, false
set :keep_releases, 3
#set :bundle_without, [:development,:test]

set :deploy_to, "/home/rails/#{application}"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# If you are using Passenger mod_rails uncomment this:
 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end

   desc "Symlinks the database.rb"
   task :symlink_db, :roles => :app do
     run "ln -nfs #{deploy_to}/shared/config/database.rb #{release_path}/config/database.rb"
   end

   desc "init db"
   task :init_db, :roles => :db do
     run "cd #{deploy_to}/current/; bundle exec rake ar:create PADRINO_ENV=production"
     run "cd #{deploy_to}/current/; bundle exec rake ar:migrate PADRINO_ENV=production"
   end
 end

after 'deploy:update_code', 'deploy:symlink_db','deploy:init_db' 
