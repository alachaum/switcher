class ProcessUnitsController < ApplicationController
  # GET /process_units
  # GET /process_units.xml
  def index
    @process_units = ProcessUnit.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @process_units }
    end
  end

  # GET /process_units/1
  # GET /process_units/1.xml
  def show
    @process_unit = ProcessUnit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @process_unit }
    end
  end

  # GET /process_units/new
  # GET /process_units/new.xml
  def new
    @process_unit = ProcessUnit.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @process_unit }
    end
  end

  # GET /process_units/1/edit
  def edit
    @process_unit = ProcessUnit.find(params[:id])
  end

  # POST /process_units
  # POST /process_units.xml
  def create
    @process_unit = ProcessUnit.new(params[:process_unit])

    respond_to do |format|
      if @process_unit.save
        format.html { redirect_to(@process_unit, :notice => 'Process unit was successfully created.') }
        format.xml  { render :xml => @process_unit, :status => :created, :location => @process_unit }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @process_unit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /process_units/1
  # PUT /process_units/1.xml
  def update
    @process_unit = ProcessUnit.find(params[:id])

    respond_to do |format|
      if @process_unit.update_attributes(params[:process_unit])
        format.html { redirect_to(@process_unit, :notice => 'Process unit was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @process_unit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /process_units/1
  # DELETE /process_units/1.xml
  def destroy
    @process_unit = ProcessUnit.find(params[:id])
    @process_unit.destroy

    respond_to do |format|
      format.html { redirect_to(process_units_url) }
      format.xml  { head :ok }
    end
  end
end
