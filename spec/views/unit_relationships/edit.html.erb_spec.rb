require 'spec_helper'

describe "unit_relationships/edit.html.erb" do
  before(:each) do
    @unit_relationship = assign(:unit_relationship, stub_model(UnitRelationship,
      :parent_id => 1,
      :child_id => 1
    ))
  end

  it "renders the edit unit_relationship form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => unit_relationship_path(@unit_relationship), :method => "post" do
      assert_select "input#unit_relationship_parent_id", :name => "unit_relationship[parent_id]"
      assert_select "input#unit_relationship_child_id", :name => "unit_relationship[child_id]"
    end
  end
end
