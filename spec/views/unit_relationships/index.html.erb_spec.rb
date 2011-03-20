require 'spec_helper'

describe "unit_relationships/index.html.erb" do
  before(:each) do
    assign(:unit_relationships, [
      stub_model(UnitRelationship,
        :parent_id => 1,
        :child_id => 1
      ),
      stub_model(UnitRelationship,
        :parent_id => 1,
        :child_id => 1
      )
    ])
  end

  it "renders a list of unit_relationships" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
