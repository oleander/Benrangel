desc "Compiles CoffeeScript using Barrista"
task 'coffee:compile' => ['barista:brew']

desc "Compiles SASS using Compass"
task 'sass:compile' do
  system 'compass compile'
end

namespace :assets do
  desc "Compiles all assets (CSS/JS)"
  task :compile => ['coffee:compile', 'sass:compile']
  
  desc "Bundles all assets with Jammit"
  task :bundle => :environment do
    system "cd #{Rails.root} && jammit"
  end
end

desc "Compiles and bundles all assets"
task :assets => ['assets:compile', 'assets:bundle']