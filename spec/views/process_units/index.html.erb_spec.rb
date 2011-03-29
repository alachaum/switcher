require 'spec_helper'

describe "process_units/index.html.erb" do
  before(:each) do
    assign(:process_units, [
      stub_model(ProcessUnit,
        :name => "Name",
        :process_flow_id => 1,
        :description => "MyText"
      ),
      stub_model(ProcessUnit,
        :name => "Name",
        :process_flow_id => 1,
        :description => "MyText"
      )
    ])
  end

  it "renders a list of process_units" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
