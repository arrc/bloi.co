# config valid only for current version of Capistrano
lock '3.6.0'

set :application, 'bloiapp'
set :repo_url, 'git@github.com:arrc/bloi.co.git'
set :deploy_to, '/opt/www/bloiapp'
set :user, 'deployer'
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets}
append :linked_files, 'config/database.yml', 'config/secrets.yml', 'config/application.yml'

# Default value for linked_dirs is []
# append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# before 'deploy:assets:precompile'
namespace :deploy do
  %w[start stop restart].each do |command|
    desc "Manage Unicorn"
    task command do
      on roles(:app), in: :sequence, wait: 1 do
        execute "/etc/init.d/unicorn_#{fetch(:application)} #{command}"
      end
    end
  end

  after :publishing, :restart
end
