require File.dirname(__FILE__) + '/../spec_helper'

describe Ticket do
  before(:each) do
    @ticket = Ticket.new
  end

  it "should be valid" do
    @ticket.should be_valid
  end
end
