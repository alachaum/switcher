require 'spec_helper'

describe "process_units/show.html.erb" do
  before(:each) do
    @process_unit = assign(:process_unit, stub_model(ProcessUnit,
      :name => "Name",
      :process_flow_id => 1,
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
