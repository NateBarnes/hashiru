role :app, "ec2-107-22-87-117.compute-1.amazonaws.com", :primary => true, :thin => true
role :web, "ec2-107-22-87-117.compute-1.amazonaws.com"
#role :db, "blarg", :primary => true

set :rails_env, 'development'

set :ssh_options, {:keys => [File.join(ENV["HOME"], ".ssh", "hashiru.pem")] }

set :branch, 'master'

set :rvm_ruby_string, '2.0@hashiru'        # Or whatever env you want it to run in.
