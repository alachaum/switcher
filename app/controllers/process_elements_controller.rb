class ProcessElementsController < ApplicationController
  # GET /process_elements
  # GET /process_elements.xml
  def index
    @process_elements = ProcessElement.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @process_elements }
    end
  end

  # GET /process_elements/1
  # GET /process_elements/1.xml
  def show
    @process_element = ProcessElement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @process_element }
    end
  end

  # GET /process_elements/new
  # GET /process_elements/new.xml
  def new
    @process_element = ProcessElement.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @process_element }
    end
  end

  # GET /process_elements/1/edit
  def edit
    @process_element = ProcessElement.find(params[:id])
  end

  # POST /process_elements
  # POST /process_elements.xml
  def create
    @process_element = ProcessElement.new(params[:process_element])

    respond_to do |format|
      if @process_element.save
        format.html { redirect_to(@process_element, :notice => 'Process element was successfully created.') }
        format.xml  { render :xml => @process_element, :status => :created, :location => @process_element }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @process_element.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /process_elements/1
  # PUT /process_elements/1.xml
  def update
    @process_element = ProcessElement.find(params[:id])

    respond_to do |format|
      if @process_element.update_attributes(params[:process_element])
        format.html { redirect_to(@process_element, :notice => 'Process element was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @process_element.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /process_elements/1
  # DELETE /process_elements/1.xml
  def destroy
    @process_element = ProcessElement.find(params[:id])
    @process_element.destroy

    respond_to do |format|
      format.html { redirect_to(process_elements_url) }
      format.xml  { head :ok }
    end
  end
end
