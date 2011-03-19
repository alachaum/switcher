require 'spec_helper'

describe "process_units/show.html.erb" do
  before(:each) do
    @process_unit = assign(:process_unit, stub_model(ProcessUnit))
  end

  it "renders attributes in <p>" do
    render
  end
end
