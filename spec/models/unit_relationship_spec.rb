require 'spec_helper'

describe UnitRelationship do
  before(:each) do
    @p_flow = Factory(:process_flow)
    @parent_unit = Factory(:process_unit, :process_flow => @p_flow)
    @child_unit = Factory(:process_unit, :process_flow => @p_flow)
    @attr = {
      :parent_id => @parent_unit.id, 
      :child_id => @child_unit
    }
  end
  
  describe "creation" do
     it "should create a relationship given valid attributes" do
       UnitRelationship.create(@attr)
     end
     
     it "should require a parent id" do
       relation_no_parent_id = UnitRelationship.new(@attr.merge(:parent_id => ""))
       relation_no_parent_id.should_not be_valid
     end
     
     it "should require a child id" do
        relation_no_child_id = UnitRelationship.new(@attr.merge(:child_id => ""))
        relation_no_child_id.should_not be_valid
      end
  end
end
