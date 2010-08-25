require 'spec_helper'

describe "routing to static pages" do
  it "routes /:path to static#view with :path => path" do
    defaults = {:controller => 'static', :action => 'view'}
    
    ['/welcome', '/more/complex', '/even/more/complex.html'].each do |path|
      {:get => path}.should route_to defaults.merge(:path => path.gsub(%r{\A/}, ''))
    end
  end
end