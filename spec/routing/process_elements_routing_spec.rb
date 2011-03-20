require "spec_helper"

describe ProcessElementsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/process_elements" }.should route_to(:controller => "process_elements", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/process_elements/new" }.should route_to(:controller => "process_elements", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/process_elements/1" }.should route_to(:controller => "process_elements", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/process_elements/1/edit" }.should route_to(:controller => "process_elements", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/process_elements" }.should route_to(:controller => "process_elements", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/process_elements/1" }.should route_to(:controller => "process_elements", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/process_elements/1" }.should route_to(:controller => "process_elements", :action => "destroy", :id => "1")
    end

  end
end
