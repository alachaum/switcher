require 'spec_helper'

describe UnitRelationship do
  before(:each) do
    @p_flow = Factory(:process_flow)
    @parent_unit = Factory(:process_unit, :process_flow => @p_flow)
    @child_unit = Factory(:process_unit, :process_flow => @p_flow)
    @attr = {
      :parent_unit_id => @parent_unit.id, 
      :child_unit_id => @child_unit.id
    }
    @relationship = UnitRelationship.new(@attr)
  end
  
  describe "creation" do
    it "should create a relationship given valid attributes" do
       @relationship.save!
    end
     
    it "should require a parent unit id" do
       relation_no_parent_id = UnitRelationship.new(@attr.merge(:parent_unit_id => ""))
       relation_no_parent_id.should_not be_valid
    end
     
    it "should require a child unit id" do
        relation_no_child_id = UnitRelationship.new(@attr.merge(:child_unit_id => ""))
        relation_no_child_id.should_not be_valid
    end
    
    it "should forbid any duplicate relationship" do
      @relationship.save!
      duplicate = UnitRelationship.new(@attr)
      duplicate.should_not be_valid
      @other_unit = Factory(:process_unit, :process_flow => @p_flow)
      not_duplicate = UnitRelationship.new(@attr.merge(:child_unit_id => @other_unit.id))
      not_duplicate.should be_valid
    end
    
    it "should forbid a loop relationship" do
      @reverse_attr = {
        :parent_unit_id => @child_unit.id,
        :child_unit_id => @parent_unit.id
      }
      @relationship.save!
      reverse_relation = UnitRelationship.new(@reverse_attr)
      reverse_relation.should_not be_valid
    end
    
    it "should forbid a self relationship" do
      self_relation = UnitRelationship.new(@attr.merge(:child_unit_id => @parent_unit.id))
      self_relation.should_not be_valid
    end
  end
  
  describe "parent-child relationship" do
    before(:each) do
      @relationship.save
    end
    
    it "should have a parent_unit attribute" do
      @relationship.should respond_to(:parent_unit)
    end
    
    it "should have the right parent unit" do
      @relationship.parent_unit.should == @parent_unit
    end
    
    it "should have a child_unit attribute" do
      @relationship.should respond_to(:child_unit)
    end
    
    it "should have the right child unit" do
      @relationship.child_unit.should == @child_unit
    end
  end
end
