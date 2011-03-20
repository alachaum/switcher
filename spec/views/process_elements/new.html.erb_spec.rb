require 'spec_helper'

describe "process_elements/new.html.erb" do
  before(:each) do
    assign(:process_element, stub_model(ProcessElement,
      :name => "MyString",
      :description => "MyText",
      :type => "MyString",
      :process_unit_id => 1
    ).as_new_record)
  end

  it "renders new process_element form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => process_elements_path, :method => "post" do
      assert_select "input#process_element_name", :name => "process_element[name]"
      assert_select "textarea#process_element_description", :name => "process_element[description]"
      assert_select "input#process_element_type", :name => "process_element[type]"
      assert_select "input#process_element_process_unit_id", :name => "process_element[process_unit_id]"
    end
  end
end
