require 'spec_helper'

describe StaticController do
  render_views
  
  it "renders static pages" do
    controller.class.view_paths = [ActionView::FixtureResolver.new({
      "layouts/application.html.haml" => "= yield",
      "static/complex/website.html.haml" => "fake content"
    })]
    
    get :view, :path => "complex/website.html"
    response.body.should match "fake content"
  end
end
