class DetailsController < ApplicationController
  # GET /details
  # GET /details.json
  def index
    @details = if params[:score_id]
      @subject = Score.find params[:score_id]
      @subject.details
    elsif params[:endeavor_id]
      @subject = Endeavor.find params[:endeavor_id]
      @subject.details
    else
      Detail.all
    end

    respond_to do |format|
      format.js
      format.html # index.html.erb
      format.json { render :json => @details }
    end
  end

  # GET /details/1
  # GET /details/1.json
  def show
    @detail = Detail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @detail }
    end
  end
  
  def download_payload_for
    @detail = Detail.find(params[:id])
    send_file @detail.payload.path
  end

  # GET /details/new
  # GET /details/new.json
  def new
    @detail = Detail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @detail }
    end
  end

  # GET /details/1/edit
  def edit
    @detail = Detail.find(params[:id])
  end

  # POST /details
  # POST /details.json
  def create
    @detail = Detail.new(params[:detail])
    @detail.member = current_member

    respond_to do |format|
      if @detail.save
        format.html { redirect_to @detail, :notice => 'Detail was successfully created.' }
        format.json { render :json => @detail, :status => :created, :location => @detail }
      else
        format.html { render :action => "new" }
        format.json { render :json => @detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /details/1
  # PUT /details/1.json
  def update
    @detail = Detail.find(params[:id])

    respond_to do |format|
      if @detail.update_attributes(params[:detail])
        format.html { redirect_to @detail, :notice => 'Detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /details/1
  # DELETE /details/1.json
  def destroy
    @detail = Detail.find(params[:id])
    @detail.destroy

    respond_to do |format|
      format.html { redirect_to details_url }
      format.json { head :no_content }
    end
  end
end
