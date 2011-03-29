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
  
  describe "process element association" do
    before(:each) do
      @process_unit = @process_flow.process_units.create(@attr)
      @p_element_1 = Factory(:process_element, :process_unit => @process_unit)
      @p_element_2 = Factory(:process_element, :process_unit => @process_unit)
    end
    
    it "should have a process_elements attribute" do
      @process_unit.should respond_to(:process_elements)
    end
    
    it "should have the right elements" do
      @process_unit.process_elements.should == [@p_element_1, @p_element_2]
    end
    
    it "should destroy the elements when the unit is destroyed" do
      @process_unit.destroy
      [@p_element_1, @p_element_2].each do |p_element|
        ProcessElement.find_by_id(p_element.id).should be_nil
      end
    end
  end
  
  describe "parent-child relationships" do
    before(:each) do
      @parent_unit = @process_flow.process_units.create(@attr)
      @child_unit = @process_flow.process_units.create(@attr.merge(:name => "Test name 2"))
    end
    
    it "should have a unit_relationships method" do
      @parent_unit.should respond_to(:unit_relationships)
    end

    it "should have a unit_reverse_relationships method" do
      @child_unit.should respond_to(:unit_reverse_relationships)
    end

    it "should create a relationship given valid attributes" do
      @parent_unit.unit_relationships.create(:child_unit_id => @child_unit.id)
    end

    it "should create a reverse relationship given valid attributes" do
      @child_unit.unit_reverse_relationships.create(:parent_unit_id => @parent_unit.id)
    end

    it "should relate the parent and child to the right relationship" do
      @parent_unit.unit_relationships.create(:child_unit_id => @child_unit.id)
      @parent_unit.unit_relationships.first.parent_unit_id.should == @parent_unit.id
      @parent_unit.unit_relationships.first.child_unit_id.should == @child_unit.id
    end

    it "should relate the parent and child to the right reverse relationship" do
      @child_unit.unit_reverse_relationships.create(:parent_unit_id => @parent_unit.id)
      @child_unit.unit_reverse_relationships.first.parent_unit_id.should == @parent_unit.id
      @child_unit.unit_reverse_relationships.first.child_unit_id.should == @child_unit.id
    end

    it "should have a child_units method" do
      @parent_unit.should respond_to(:child_units)
    end
  
    it "should have a parent_units method" do
      @child_unit.should respond_to(:parent_units)
    end
  
    it "should have a parent_of method" do
      @parent_unit.should respond_to(:parent_of)
    end
  
    it "should have a child_of method" do
      @child_unit.should respond_to(:child_of)
    end
  
    it "should have a parent_of? method" do
      @parent_unit.should respond_to(:parent_of?)
    end
  
    it "should have a child_of? method" do
      @child_unit.should respond_to(:child_of?)
    end
  
    it "should have a linked_to? method" do
      @parent_unit.should respond_to(:linked_to?)
    end
  
    it "should make parent of another unit" do
      @parent_unit.parent_of(@child_unit)
      @parent_unit.child_units.should include(@child_unit)
      @child_unit.parent_units.should include(@parent_unit)
    end
  
    it "should make child of another unit" do
      @child_unit.child_of(@parent_unit)
      @child_unit.parent_units.should include(@parent_unit)
      @parent_unit.child_units.should include(@child_unit)
    end
  
    it "should be parent of a child unit" do
      @parent_unit.parent_of(@child_unit)
      @parent_unit.should be_parent_of(@child_unit)
      @child_unit.should be_child_of(@parent_unit)
    end
  
    it "should be child of a parent unit" do
      @child_unit.child_of(@parent_unit)
      @child_unit.should be_child_of(@parent_unit)
    end
  
    it "should be linked to another unit" do
      @parent_unit.parent_of(@child_unit)
      @parent_unit.should be_linked_to(@child_unit)
      @child_unit.should be_linked_to(@parent_unit)
    end
  end
  
  describe "unit tree construction" do
    before(:each) do
      @parent_unit_1 = @process_flow.process_units.create(@attr)
      @parent_unit_2 = @process_flow.process_units.create(@attr)
      [@parent_unit_1, @parent_unit_2].each do |parent_unit|
        3.times do
          child_unit = @process_flow.process_units.create(@attr)
          parent_unit.parent_of(child_unit)
        end
      end
      
    end
    
    it "should have a find_children_of class method" do
      ProcessUnit.should respond_to(:find_children_of)
    end
    
    it "should include the direct children of a unit" do
      children = ProcessUnit.find_children_of(@parent_unit_1)
      @parent_unit_1.child_units.each do |unit|
        children.should include(unit)
      end
      children.size.should == @parent_unit_1.child_units.size
    end
    
    it "should include the direct children of several units" do
      children = ProcessUnit.find_children_of(@parent_unit_1,@parent_unit_2)
      [@parent_unit_1, @parent_unit_2].each do |parent_unit|
        parent_unit.child_units.each do |unit|
          children.should include(unit)
        end
      end
    end
    
    it "should include common chilren only once" do
      common_child = @process_flow.process_units.create(@attr)
      @parent_unit_1.parent_of(common_child)
      @parent_unit_2.parent_of(common_child)
      children = ProcessUnit.find_children_of(@parent_unit_1,@parent_unit_2)
      children.should include(common_child)
      children.size.should == @parent_unit_1.child_units.size + @parent_unit_2.child_units.size - 1
    end
    
    it "should return the children of a process flow (units with no parents)" do
      children = ProcessUnit.find_children_of(@process_flow)
      [@parent_unit_1, @parent_unit_2].each do |unit|
        children.should include(unit)
      end
      children.size.should == 2
    end
    
    it "should not include external children" do
      other_p_flow = Factory(:process_flow)
      other_parent_unit = other_p_flow.process_units.create(@attr)
      other_child_unit = other_p_flow.process_units.create(@attr)
      other_parent_unit.parent_of(other_child_unit)
      children = ProcessUnit.find_children_of(@parent_unit_1,@parent_unit_2)
      children.should_not include(other_child_unit)
      children = ProcessUnit.find_children_of(@process_flow)
      children.should_not include(other_parent_unit)
    end
    
    it "should have a build_unit_tree class method" do
      ProcessUnit.should respond_to(:build_unit_tree)
    end
    
    it "should contain the right children at the right level" do
      unit_tree = ProcessUnit.build_unit_tree(@process_flow)
      [@parent_unit_1, @parent_unit_2].each do |parent|
        unit_tree[0].should include(parent)
        parent.child_units.each do |unit|
          unit_tree[1].should include(unit)
        end
      end
    end
    
    it "should contain a child only once" do
      child = @process_flow.process_units.create(@attr)
      @parent_unit_1.parent_of(child)
      grand_child = @process_flow.process_units.create(@attr)
      child.parent_of(grand_child)
      @parent_unit_1.parent_of(grand_child)
      unit_tree = ProcessUnit.build_unit_tree(@process_flow)
      unit_tree[2].should include(grand_child)
      unit_tree[1].should_not include(grand_child) 
    end
  end
end
