class UnitRelationshipsController < ApplicationController
  # GET /unit_relationships
  # GET /unit_relationships.xml
  def index
    @unit_relationships = UnitRelationship.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @unit_relationships }
    end
  end

  # GET /unit_relationships/1
  # GET /unit_relationships/1.xml
  def show
    @unit_relationship = UnitRelationship.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @unit_relationship }
    end
  end

  # GET /unit_relationships/new
  # GET /unit_relationships/new.xml
  def new
    @unit_relationship = UnitRelationship.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @unit_relationship }
    end
  end

  # GET /unit_relationships/1/edit
  def edit
    @unit_relationship = UnitRelationship.find(params[:id])
  end

  # POST /unit_relationships
  # POST /unit_relationships.xml
  def create
    @unit_relationship = UnitRelationship.new(params[:unit_relationship])

    respond_to do |format|
      if @unit_relationship.save
        format.html { redirect_to(@unit_relationship, :notice => 'Unit relationship was successfully created.') }
        format.xml  { render :xml => @unit_relationship, :status => :created, :location => @unit_relationship }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @unit_relationship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /unit_relationships/1
  # PUT /unit_relationships/1.xml
  def update
    @unit_relationship = UnitRelationship.find(params[:id])

    respond_to do |format|
      if @unit_relationship.update_attributes(params[:unit_relationship])
        format.html { redirect_to(@unit_relationship, :notice => 'Unit relationship was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @unit_relationship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /unit_relationships/1
  # DELETE /unit_relationships/1.xml
  def destroy
    @unit_relationship = UnitRelationship.find(params[:id])
    @unit_relationship.destroy

    respond_to do |format|
      format.html { redirect_to(unit_relationships_url) }
      format.xml  { head :ok }
    end
  end
end
