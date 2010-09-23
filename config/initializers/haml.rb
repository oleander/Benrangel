# Load Haml and Sass.
Haml.init_rails(binding) if defined?(Haml)

Benrangel::Application.configure do
  config.generators do |g|
    g.template_engine :haml
  end
end if defined? Benrangel::Application

Haml::Template.options.merge!({
  :format => :html5, 
  :escape_html => true, 
  :attr_wrapper => '"'
})

# Sass::Plugin.options.merge!({
#   :template_location => {"#{Rails.root}/app/stylesheets/" => "#{Rails.root}/public/stylesheets"}
# })