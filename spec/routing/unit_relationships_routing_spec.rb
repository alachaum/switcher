require "spec_helper"

describe UnitRelationshipsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/unit_relationships" }.should route_to(:controller => "unit_relationships", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/unit_relationships/new" }.should route_to(:controller => "unit_relationships", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/unit_relationships/1" }.should route_to(:controller => "unit_relationships", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/unit_relationships/1/edit" }.should route_to(:controller => "unit_relationships", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/unit_relationships" }.should route_to(:controller => "unit_relationships", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/unit_relationships/1" }.should route_to(:controller => "unit_relationships", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/unit_relationships/1" }.should route_to(:controller => "unit_relationships", :action => "destroy", :id => "1")
    end

  end
end
