if Rails.env.development?
  require 'vlad'
  Vlad.load :scm => :git, :web => :nginx
end