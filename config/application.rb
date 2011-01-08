require File.expand_path('../boot', __FILE__)

require 'rails/all'

# If you have a Gemfile, require the gems listed there, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env) if defined?(Bundler)

module Benrangel
  class Application < Rails::Application
    # Custom directories with classes and modules you want to be autoloadable.
    config.autoload_paths += %W(#{config.root}/my/extras)
    
    # Set default locale to Swedish and add my/locales/*.{rb,yml} to autoload.
    config.i18n.default_locale = :'sv-SE'
    
    # JavaScript files you want as :defaults (application.js is always included).
    config.action_view.javascript_expansions[:defaults] = %w(http://code.jquery.com/jquery-1.4.2.min.js)

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]
    
    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer
    
    # Assume threadsafe operations
    config.threadsafe!
    
    # Remove trailing slashes from URLs
    # Note: put it as high as possible, so we don’t process unnecessary requests
    config.middleware.insert 0, Rack::Rewrite do
      r301 %r{\A/(.*)/\z}, '/$1'
    end
    
    config.generators do |g|
      g.template_engine :haml
    end
    
    config.time_zone = 'Stockholm'
      
    # Cache handler etags/if-modified-since
    # Note: put as high as possible (but after redirects) so cache hits early
    config.middleware.insert_after(Rack::Rewrite, Rack::Cache, {
      :verbose => true,
      :metastore => 'file:tmp/rack-cache/meta',
      :entitystore => 'file:tmp/rack-cache/body'
    })
  end
end
