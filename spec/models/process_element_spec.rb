require 'spec_helper'

describe ProcessElement do
  
  before(:each) do
    @process_flow = Factory(:process_flow)
    @process_unit = Factory(:process_unit, :process_flow => @process_flow)
    @attr = {
      :name => "Process element name",
      :description => "Process element description",
      :role => "a_role",
      :function_name => "a_function_name",
      :function_parameters => "param1,param2"
    }
  end
  
  describe "creation" do
    it "should create the element given valid attributes" do
      @process_unit.process_elements.create!(@attr)
    end
    
    it "should require a name" do
      element_no_name = @process_unit.process_elements.new(@attr.merge(:name => ""))
      element_no_name.should_not be_valid
    end
    
    it "should require a role" do
      element_no_type = @process_unit.process_elements.new(@attr.merge(:role => ""))
      element_no_type.should_not be_valid
    end
  end
  
  describe "process unit association" do
    before(:each) do
      @process_element = @process_unit.process_elements.create(@attr)
    end
    
    it "should have a process_unit attribute" do
      @process_element.should respond_to(:process_unit)
    end
    
    it "should have the right process unit associated" do
      @process_element.process_unit.id.should == @process_unit.id
      @process_element.process_unit.should == @process_unit
    end
  end
end
