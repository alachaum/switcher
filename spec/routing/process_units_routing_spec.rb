require "spec_helper"

describe ProcessUnitsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/process_units" }.should route_to(:controller => "process_units", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/process_units/new" }.should route_to(:controller => "process_units", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/process_units/1" }.should route_to(:controller => "process_units", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/process_units/1/edit" }.should route_to(:controller => "process_units", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/process_units" }.should route_to(:controller => "process_units", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/process_units/1" }.should route_to(:controller => "process_units", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/process_units/1" }.should route_to(:controller => "process_units", :action => "destroy", :id => "1")
    end

  end
end
