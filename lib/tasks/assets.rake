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
  
  desc "Removes all compiled and bundled assets"
  task :clean => :environment do
    files = []
    files << ['assets']
    files << ['javascripts', 'compiled']
    files << ['stylesheets', 'compiled']
    files = files.map { |path| Dir[Rails.root.join('public', *path, '*.*')] }.flatten
    
    puts "Removing:"
    files.each do |file|
      puts "  #{file.gsub(Rails.root.to_s + '/', '')}"
    end
    
    File.delete *files
  end
end

desc "Compiles and bundles all assets"
task :assets => ['assets:compile', 'assets:bundle']