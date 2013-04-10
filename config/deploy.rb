# Capistrano for webfaction deployment using information from 
# 'https://dowdrake.com/posts/1-rails-3-2-webfaction-capistrano-tips'

set :application, "committeeprofiles"
set :repository,  "https://github.com/chimere/committeeprofiles.git"
# set :branch, "master"

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :deploy_to, "/home/chimere/webapps/committeeprofiles"

set :default_environment, {
     'PATH' => "#{deploy_to}/bin:$PATH",
     'GEM_HOME' => "#{deploy_to}/gems" 
   }
   
set :rake, 'bundle exec rake'

set :domain, "chimere.webfactional.com"

role :web, domain   # Your HTTP server, Apache/etc
role :app, domain   # This may be the same as your `Web` server
role :db,  domain, :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

set :user, "chimere"
set :scm_username, "530add90"
set :use_sudo, false
default_run_options[:pty] = true

# Make sure any needed gems are installed
before "deploy:assets:precompile", "gems:install"
namespace :gems do
  desc "Install gems"
  task :install, :roles => :app do
    run "cd #{current_release} && bundle install --without development test"
  end
end

# Add a symlink to the shared uploads directory (create this directory manually)
namespace :uploads do
  desc "Create the symlink to uploads shared folder for most recent version"
  task :create_symlink, :except => { :no_release => true } do
    run "rm -rf #{release_path}/public/uploads"
    run "ln -nfs #{shared_path}/uploads #{release_path}/public/uploads"
  end
end

# only keep the last 5 deployments on the server
after "deploy", "deploy:cleanup"
after "deploy:migrations", "deploy:cleanup"
after "deploy:finalize_update", "uploads:create_symlink"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end