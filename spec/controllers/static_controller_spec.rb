require 'spec_helper'

describe StaticController do
  before :each do
    controller.class.view_paths = [ActionView::FixtureResolver.new({
      "layouts/application.html.haml" => "= yield",
      "static/complex/website.html.haml" => "fake content",
      "http/404.html.haml" => '404',
    })]
  end
  
  it "renders static pages" do
    get :view, :path => "complex/website"
    response.should render_template 'static/complex/website'
  end
  
  it "renders http error pages" do
    get :view, :path => 'this/should/not/be/found'
    response.should render_template 'http/404'
  end
end
