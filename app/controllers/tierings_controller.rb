class TieringsController < ApplicationController
  # GET /tierings
  # GET /tierings.json
  def index
    @tierings = Tiering.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @tierings }
    end
  end

  # GET /tierings/1
  # GET /tierings/1.json
  def show
    @tiering = Tiering.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @tiering }
    end
  end

  # GET /tierings/new
  # GET /tierings/new.json
  def new
    @tiering = Tiering.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @tiering }
    end
  end

  # GET /tierings/1/edit
  def edit
    @tiering = Tiering.find(params[:id])
  end

  # POST /tierings
  # POST /tierings.json
  def create
    @tiering = Tiering.new(params[:tiering])

    respond_to do |format|
      if @tiering.save
        format.html { redirect_to @tiering.tier, :notice => "#{current_member.tierings.count.ordinalize} goal in this tier." }
        format.json { render :json => @tiering, :status => :created, :location => @tiering }
      else
        format.html { render :action => "new" }
        format.json { render :json => @tiering.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tierings/1
  # PUT /tierings/1.json
  def update
    @tiering = Tiering.find(params[:id])

    respond_to do |format|
      if @tiering.update_attributes(params[:tiering])
        format.html { redirect_to @tiering, :notice => 'Tiering was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @tiering.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def sort
    @tierings = Tiering.find params[:tiering]
    @tierings.each do |tiering|
      tiering.position = params['tiering'].index(tiering.id.to_s) + 1
      tiering.save
    end
    render :nothing => true
  end

  # DELETE /tierings/1
  # DELETE /tierings/1.json
  def destroy
    @tiering = Tiering.find(params[:id])
    @tiering.destroy

    respond_to do |format|
      format.html { redirect_to tierings_url }
      format.json { head :no_content }
    end
  end
end
