require 'spec_helper'

describe ApplicationHelper do

  describe "full_title" do
    it "should include the page title" do
      full_title("foo").should =~ /foo/
    end

    it "should include the base title" do
      full_title("foo").should =~ /^Proofler/
    end

    it "should not include a bar for the home page" do
      full_title("").should_not =~ /\|/
    end

    it "should not include a bar for the home page" do
      full_title(nil).should_not =~ /\|/
    end

    it "should show the default the home page" do
      full_title("").should == "Proofler"
    end

    it "should show the default the home page" do
      full_title(nil).should == "Proofler"
    end
  end

end
