# config valid only for current version of Capistrano
lock '3.6.0'

set :application, 'bloiapp'
set :repo_url, 'git@github.com:arrc/bloi.co.git'
set :deploy_to, '/opt/www/bloiapp'
set :user, 'deployer'
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets}

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, 'config/database.yml', 'config/secrets.yml', 'config/application.yml'

# Default value for linked_dirs is []
# append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
# before 'deploy:assets:precompile', "deploy:symlink_config_files"
namespace :deploy do
  %w[start stop restart].each do |command|
    desc "Manage Unicorn"
    task command do
      on roles(:app), in: :sequence, wait: 1 do
        execute "/etc/init.d/unicorn_#{fetch(:application)} #{command}"
      end
    end
  end

  desc "Symlink shared config files"
  task :symlink_config_files do
      # run "#{ try_sudo } ln -s #{ deploy_to }/shared/config/database.yml #{ current_path }/config/database.yml"
      on roles :app do
        execute "ln -s #{ deploy_to }/shared/config/database.yml #{ release_path }/config/database.yml"
        execute "ln -s #{ deploy_to }/shared/config/secrets.yml #{ release_path }/config/secrets.yml"
      end
  end

  after :publishing, :restart
  # before :deploy, "deploy:symlink_config_files"
  # after :restart, :clear_cache do
  #   on role(:web), in: :groups, limit: 3, wait: 10 do
  #
  #   end
  # end
end
