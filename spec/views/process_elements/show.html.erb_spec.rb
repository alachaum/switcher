require 'spec_helper'

describe "process_elements/show.html.erb" do
  before(:each) do
    @process_element = assign(:process_element, stub_model(ProcessElement,
      :name => "Name",
      :description => "MyText",
      :role => "Role",
      :process_unit_id => 1,
      :function_name => "Function Name",
      :function_parameters => "Function Parameters"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Role/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Function Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Function Parameters/)
  end
end
