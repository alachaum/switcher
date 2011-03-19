require 'spec_helper'

describe "process_units/index.html.erb" do
  before(:each) do
    assign(:process_units, [
      stub_model(ProcessUnit),
      stub_model(ProcessUnit)
    ])
  end

  it "renders a list of process_units" do
    render
  end
end
