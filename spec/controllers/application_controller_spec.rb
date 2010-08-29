require 'spec_helper'

describe ApplicationController do
  describe "helper methods" do
    describe "#title" do
      it "should allow reading and writing" do
        controller.title "Moo"
        controller.title.should == "Moo"
      end
    end
  end
end