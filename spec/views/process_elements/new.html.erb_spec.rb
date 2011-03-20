require 'spec_helper'

describe "process_elements/new.html.erb" do
  before(:each) do
    assign(:process_element, stub_model(ProcessElement,
      :name => "MyString",
      :description => "MyText",
      :role => "MyString",
      :process_unit_id => 1,
      :function_name => "MyString",
      :function_parameters => "MyString"
    ).as_new_record)
  end

  it "renders new process_element form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => process_elements_path, :method => "post" do
      assert_select "input#process_element_name", :name => "process_element[name]"
      assert_select "textarea#process_element_description", :name => "process_element[description]"
      assert_select "input#process_element_role", :name => "process_element[role]"
      assert_select "input#process_element_process_unit_id", :name => "process_element[process_unit_id]"
      assert_select "input#process_element_function_name", :name => "process_element[function_name]"
      assert_select "input#process_element_function_parameters", :name => "process_element[function_parameters]"
    end
  end
end
