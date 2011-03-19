require 'spec_helper'

describe ProcessUnit do
  
  before(:each) do
    @process_flow = Factory(:process_flow)
    @attr = {
      :name => "Test name",
      :description => "Test description"
    }
  end
  
  describe "creation" do
    it "should create the process unit given valid attributes" do
      @process_flow.process_units.create!(@attr)
    end
    
    it "should require a name" do
      unit_no_name = @process_flow.process_units.new(@attr.merge(:name => ""))
      unit_no_name.should_not be_valid
    end
    
    it "should require a process flow id" do
      unit_no_flow_id = ProcessUnit.new(@attr)
      unit_no_flow_id.should_not be_valid
    end
  end
  
  describe "process flow association" do
    before(:each) do
      @process_unit = @process_flow.process_units.create(@attr)
    end
    
    it "should have a process_flow attribute" do
      @process_unit.should respond_to(:process_flow)
    end
    
    it "should have the right process flow associated" do
      @process_unit.process_flow_id.should == @process_flow.id
      @process_unit.process_flow.should == @process_flow
    end
  end
end
