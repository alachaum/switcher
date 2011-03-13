require "spec_helper"

describe ProcessFlowsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/process_flows" }.should route_to(:controller => "process_flows", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/process_flows/new" }.should route_to(:controller => "process_flows", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/process_flows/1" }.should route_to(:controller => "process_flows", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/process_flows/1/edit" }.should route_to(:controller => "process_flows", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/process_flows" }.should route_to(:controller => "process_flows", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/process_flows/1" }.should route_to(:controller => "process_flows", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/process_flows/1" }.should route_to(:controller => "process_flows", :action => "destroy", :id => "1")
    end

  end
end
