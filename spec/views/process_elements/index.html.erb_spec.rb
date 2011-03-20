require 'spec_helper'

describe "process_elements/index.html.erb" do
  before(:each) do
    assign(:process_elements, [
      stub_model(ProcessElement,
        :name => "Name",
        :description => "MyText",
        :type => "Type",
        :process_unit_id => 1
      ),
      stub_model(ProcessElement,
        :name => "Name",
        :description => "MyText",
        :type => "Type",
        :process_unit_id => 1
      )
    ])
  end

  it "renders a list of process_elements" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
