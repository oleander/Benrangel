desc "Renames your Rails 3 application"
task :'app:rename' => :environment do
  abort "Please specify a new name for your application using NAME=newname" unless ENV['NAME']
  
  # Declare old name and new name
  appname = Rails.application.class.to_s.gsub(/::.*\z/, '')
  newname = ENV['NAME'].titleize
  
  # Command to run:
  puts "This will rename your application #{appname} to #{newname}"
  print "Are you sure? [N] (y/n): "
  abort unless getc.chr.match(/y/i)
  
  # Replacements
  replacement = {
    "module #{appname}" => "module #{newname}",
    "#{appname}::Application" => "#{newname}::Application"
  }.map do |key, val|
    %Q{'gsub("#{key}", "#{val}")'}
  end.join(' -e ')
    
  IO.popen("xargs ruby -pi -e #{replacement}", 'w') do |io|
    io.puts *(
      Dir.glob(File.join(Rails.root, 'config', '**', '*.rb')) +
      ['config.ru', 'Rakefile'].map { |str| File.join(Rails.root, str) }
    )
  end
  
  puts "Files modified."
end