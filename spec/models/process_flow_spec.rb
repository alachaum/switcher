require 'spec_helper'

describe ProcessFlow do
  
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
  
  describe "process unit association" do
    before(:each) do
      @process_flow = ProcessFlow.create!(@attr)      
      @p_unit_1 = Factory(:process_unit, :process_flow => @process_flow)
      @p_unit_2 = Factory(:process_unit, :process_flow => @process_flow)  
    end
    
    it "should have a process_units attribute" do
      @process_flow.should respond_to(:process_units)
    end
    
    it "should have the right process units" do
      @process_flow.process_units.should == [@p_unit_1, @p_unit_2]
    end
    
    it "should destroy the units when the flow is destroyed" do
      @process_flow.destroy
      [@p_unit_1, @p_unit_2].each do |p_unit|
        ProcessUnit.find_by_id(p_unit.id).should be_nil
      end
    end
    
    it "should have a unit_tree method" do
      @process_flow.should respond_to(:unit_tree)
    end
    
    it "shoud have its units in the unit_tree" do
      unit_tree = @process_flow.unit_tree
      [@p_unit_1, @p_unit_2].each do |unit|
        unit_tree[0].should include(unit)
      end
    end
  end
end
