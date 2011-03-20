require 'spec_helper'

describe "process_elements/edit.html.erb" do
  before(:each) do
    @process_element = assign(:process_element, stub_model(ProcessElement,
      :name => "MyString",
      :description => "MyText",
      :type => "MyString",
      :process_unit_id => 1
    ))
  end

  it "renders the edit process_element form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => process_element_path(@process_element), :method => "post" do
      assert_select "input#process_element_name", :name => "process_element[name]"
      assert_select "textarea#process_element_description", :name => "process_element[description]"
      assert_select "input#process_element_type", :name => "process_element[type]"
      assert_select "input#process_element_process_unit_id", :name => "process_element[process_unit_id]"
    end
  end
end
