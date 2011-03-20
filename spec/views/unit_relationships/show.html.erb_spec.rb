require 'spec_helper'

describe "unit_relationships/show.html.erb" do
  before(:each) do
    @unit_relationship = assign(:unit_relationship, stub_model(UnitRelationship,
      :parent_id => 1,
      :child_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
