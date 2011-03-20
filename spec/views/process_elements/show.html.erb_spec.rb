require 'spec_helper'

describe "process_elements/show.html.erb" do
  before(:each) do
    @process_element = assign(:process_element, stub_model(ProcessElement,
      :name => "Name",
      :description => "MyText",
      :type => "Type",
      :process_unit_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Type/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
