require 'spec_helper'

describe "process_units/new.html.erb" do
  before(:each) do
    assign(:process_unit, stub_model(ProcessUnit).as_new_record)
  end

  it "renders new process_unit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => process_units_path, :method => "post" do
    end
  end
end
