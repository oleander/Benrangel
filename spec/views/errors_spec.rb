describe "http/404.html.haml" do
  it "renders without error" do
    view.stub! :title => "No title"
    lambda { render }.should_not raise_error
  end
end