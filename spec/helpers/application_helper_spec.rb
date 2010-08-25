require 'spec_helper'

describe ApplicationHelper do
  describe "#yield_default" do
    before :each do
      view.view_paths = ActionView::FixtureResolver.new({
        'shared/_bogus.html.haml' => 'bogus'
      })
    end
    
    it "renders a default view without content" do
      helper.yield_default(:header, :partial => 'shared/bogus').should match 'bogus'
    end
    
    it "renders specified content when given" do
      helper.content_for :header, 'not bogus'
      helper.yield_default(:header, :partial => 'shared/bogus').should match 'not bogus'
    end
  end
end