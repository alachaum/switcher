require 'spec_helper'

describe "process_units/edit.html.erb" do
  before(:each) do
    @process_unit = assign(:process_unit, stub_model(ProcessUnit))
  end

  it "renders the edit process_unit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => process_unit_path(@process_unit), :method => "post" do
    end
  end
end
