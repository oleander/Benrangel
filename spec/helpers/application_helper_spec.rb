require 'spec_helper'

describe ApplicationHelper do
  before :each do
    view.view_paths = ActionView::FixtureResolver.new({
      'shared/_bogus.html.haml' => 'bogus'
    })
  end

  describe "#yield_default" do
    it "renders a default view without content" do
      helper.yield_default(:header, :partial => 'shared/bogus').should match 'bogus'
    end
    
    it "renders specified content when given" do
      helper.content_for :header, 'not bogus'
      helper.yield_default(:header, :partial => 'shared/bogus').should match 'not bogus'
    end
  end
  
  describe "#content_clear" do
    it "clears the content_for(:symbol) content" do
      helper.content_for :header, 'i have content'
      helper.content_for(:header).should == 'i have content'
      helper.content_clear :header
      helper.content_for(:header).should == ''
    end
  end
  
  describe "#empty_content_for" do
    it "sets an empty content_for(:symbol)" do
      helper.content_for :header, 'i have content'
      helper.content_for(:header).should == 'i have content'
      helper.empty_content_for(:header)
      helper.content_for(:header).should == 0.chr
    end
  end
  
  describe "#include_jquery" do
    it "returns a local file in development only" do
      Rails.env.stub!(:development?).and_return(true)
      helper.include_jquery.should_not match 'code.jquery.com'
      Rails.env.stub!(:development?).and_return(false)
      helper.include_jquery.should match 'code.jquery.com'
    end
  end
end