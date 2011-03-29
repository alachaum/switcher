require 'spec_helper'

describe "process_units/new.html.erb" do
  before(:each) do
    assign(:process_unit, stub_model(ProcessUnit,
      :name => "MyString",
      :process_flow_id => 1,
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new process_unit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => process_units_path, :method => "post" do
      assert_select "input#process_unit_name", :name => "process_unit[name]"
      assert_select "input#process_unit_process_flow_id", :name => "process_unit[process_flow_id]"
      assert_select "textarea#process_unit_description", :name => "process_unit[description]"
    end
  end
end
