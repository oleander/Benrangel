begin
  require 'vlad'
  Vlad.load :scm => :git, :web => :nginx
  
  namespace :vlad do
    desc "Deploy by updating, migrating and restarting"
    task :deploy => [:update, :migrate, :start_app]
    
    desc "Trust the rvmrc file"
    remote_task :update, :roles => :app do
      run "rvm rvmrc trust #{current_path}"
    end
    
    desc "Install Bundler gems"
    remote_task :update, :roles => :app do
      run "cd #{current_path} && #{bundler_cmd}"
    end
    
    desc "Compile, compress and bundle assets"
    remote_task :update, :roles => :app do
      run "cd #{current_path} && #{rake_cmd} RAILS_ENV=#{rails_env} assets"
    end
  end
rescue LoadError
  # Do nuffin'!
end