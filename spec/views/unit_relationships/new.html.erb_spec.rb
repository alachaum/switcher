require 'spec_helper'

describe "unit_relationships/new.html.erb" do
  before(:each) do
    assign(:unit_relationship, stub_model(UnitRelationship,
      :id => 1,
      :parent_unit_id => 1,
      :child_unit_id => 1
    ).as_new_record)
  end

  it "renders new unit_relationship form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => unit_relationships_path, :method => "post" do
      assert_select "input#unit_relationship_id", :name => "unit_relationship[id]"
      assert_select "input#unit_relationship_parent_unit_id", :name => "unit_relationship[parent_unit_id]"
      assert_select "input#unit_relationship_child_unit_id", :name => "unit_relationship[child_unit_id]"
    end
  end
end
