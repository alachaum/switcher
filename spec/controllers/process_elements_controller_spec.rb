require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe ProcessElementsController do

  def mock_process_element(stubs={})
    @mock_process_element ||= mock_model(ProcessElement, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all process_elements as @process_elements" do
      ProcessElement.stub(:all) { [mock_process_element] }
      get :index
      assigns(:process_elements).should eq([mock_process_element])
    end
  end

  describe "GET show" do
    it "assigns the requested process_element as @process_element" do
      ProcessElement.stub(:find).with("37") { mock_process_element }
      get :show, :id => "37"
      assigns(:process_element).should be(mock_process_element)
    end
  end

  describe "GET new" do
    it "assigns a new process_element as @process_element" do
      ProcessElement.stub(:new) { mock_process_element }
      get :new
      assigns(:process_element).should be(mock_process_element)
    end
  end

  describe "GET edit" do
    it "assigns the requested process_element as @process_element" do
      ProcessElement.stub(:find).with("37") { mock_process_element }
      get :edit, :id => "37"
      assigns(:process_element).should be(mock_process_element)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created process_element as @process_element" do
        ProcessElement.stub(:new).with({'these' => 'params'}) { mock_process_element(:save => true) }
        post :create, :process_element => {'these' => 'params'}
        assigns(:process_element).should be(mock_process_element)
      end

      it "redirects to the created process_element" do
        ProcessElement.stub(:new) { mock_process_element(:save => true) }
        post :create, :process_element => {}
        response.should redirect_to(process_element_url(mock_process_element))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved process_element as @process_element" do
        ProcessElement.stub(:new).with({'these' => 'params'}) { mock_process_element(:save => false) }
        post :create, :process_element => {'these' => 'params'}
        assigns(:process_element).should be(mock_process_element)
      end

      it "re-renders the 'new' template" do
        ProcessElement.stub(:new) { mock_process_element(:save => false) }
        post :create, :process_element => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested process_element" do
        ProcessElement.stub(:find).with("37") { mock_process_element }
        mock_process_element.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :process_element => {'these' => 'params'}
      end

      it "assigns the requested process_element as @process_element" do
        ProcessElement.stub(:find) { mock_process_element(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:process_element).should be(mock_process_element)
      end

      it "redirects to the process_element" do
        ProcessElement.stub(:find) { mock_process_element(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(process_element_url(mock_process_element))
      end
    end

    describe "with invalid params" do
      it "assigns the process_element as @process_element" do
        ProcessElement.stub(:find) { mock_process_element(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:process_element).should be(mock_process_element)
      end

      it "re-renders the 'edit' template" do
        ProcessElement.stub(:find) { mock_process_element(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested process_element" do
      ProcessElement.stub(:find).with("37") { mock_process_element }
      mock_process_element.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the process_elements list" do
      ProcessElement.stub(:find) { mock_process_element }
      delete :destroy, :id => "1"
      response.should redirect_to(process_elements_url)
    end
  end

end
