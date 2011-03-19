require 'spec_helper'

describe ProcessFlow do
  pending "add some examples to (or delete) #{__FILE__}"
  
  before(:each) do
    @attr = {
      :name => "Test Process flow",
      :description => "This is a description of the process flow"
    }
  end
  
  describe "creation" do
    it "should create a process flow given valid attributes" do
      ProcessFlow.create!(@attr)
    end
    
    it "should require a name" do
      process_no_name = ProcessFlow.new(@attr.merge(:name => ""))
      process_no_name.should_not be_valid
    end
  end
  
  
end
