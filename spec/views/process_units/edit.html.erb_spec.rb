require 'spec_helper'

describe "process_units/edit.html.erb" do
  before(:each) do
    @process_unit = assign(:process_unit, stub_model(ProcessUnit,
      :name => "MyString",
      :process_flow_id => 1,
      :description => "MyText"
    ))
  end

  it "renders the edit process_unit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => process_unit_path(@process_unit), :method => "post" do
      assert_select "input#process_unit_name", :name => "process_unit[name]"
      assert_select "input#process_unit_process_flow_id", :name => "process_unit[process_flow_id]"
      assert_select "textarea#process_unit_description", :name => "process_unit[description]"
    end
  end
end
