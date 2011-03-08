source "http://rubygems.org"

group :development, :test, :production do
  gem "rails", "~> 3.0.4"
  gem "transitions", "~> 0.0.9", :require => ["transitions", "active_record/transitions"]
  gem "metaid", "~> 1.0"
  gem "haml", "~> 3.0.18"
  
  # Forms made easy for Rails! It"s tied to a simple DSL, with no opinion on markup.
  # https://github.com/plataformatec/simple_form
  gem "simple_form"

  # A gem to automate using jQuery with Rails 3
  # https://github.com/indirect/jquery-rails
  gem "jquery-rails"

  # Required in production for compilation rake tasks!
  gem "compass", "~> 0.10.5"
  gem "barista", "~> 0.5.0"
  gem "jammit", "~> 0.5.3"

  # Rack stuff!
  gem "rack-rewrite", "~> 1.0.0"
  gem "rack-cache", "~> 0.5.3", :require => "rack/cache"
end

group :development do
  gem "barista_growl"
  
  gem "vlad"
  gem "vlad-git", "~> 2.2.0"
  gem "vlad-nginx", "~> 1"
  gem "ruby-debug19"
  gem "sqlite3-ruby", :require => "sqlite3"
  
  # A simple theme for web apps
  # https://github.com/pilu/web-app-theme
  gem "web-app-theme", ">= 0.6.2"
end

group :test do
  gem "cover_me", "~> 1.0.0.rc5"
  gem "rspec-rails", "~> 2.0.0.beta.22"
end