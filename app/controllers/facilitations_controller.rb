class FacilitationsController < ApplicationController
  # GET /facilitations
  # GET /facilitations.json
  def index
    @facilitations = Facilitation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @facilitations }
    end
  end

  # GET /facilitations/1
  # GET /facilitations/1.json
  def show
    @facilitation = Facilitation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @facilitation }
    end
  end

  # GET /facilitations/new
  # GET /facilitations/new.json
  def new
    @facilitation = Facilitation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @facilitation }
    end
  end

  # GET /facilitations/1/edit
  def edit
    @facilitation = Facilitation.find(params[:id])
  end

  # POST /facilitations
  # POST /facilitations.json
  def create
    @facilitation = Facilitation.new(params[:facilitation])

    respond_to do |format|
      if @facilitation.save
        format.html { redirect_to @facilitation, :notice => 'Facilitation was successfully created.' }
        format.json { render :json => @facilitation, :status => :created, :location => @facilitation }
      else
        format.html { render :action => "new" }
        format.json { render :json => @facilitation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /facilitations/1
  # PUT /facilitations/1.json
  def update
    @facilitation = Facilitation.find(params[:id])

    respond_to do |format|
      if @facilitation.update_attributes(params[:facilitation])
        format.html { redirect_to @facilitation, :notice => 'Facilitation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @facilitation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /facilitations/1
  # DELETE /facilitations/1.json
  def destroy
    @facilitation = Facilitation.find(params[:id])
    @facilitation.destroy

    respond_to do |format|
      format.html { redirect_to facilitations_url }
      format.json { head :no_content }
    end
  end
end
