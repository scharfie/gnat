require File.dirname(__FILE__) + '/../spec_helper'

describe Milestone do
  before(:each) do
    @milestone = Milestone.new
  end

  it "should be valid" do
    @milestone.should be_valid
  end
end
