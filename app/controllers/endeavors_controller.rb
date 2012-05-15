class EndeavorsController < ApplicationController
  # GET /endeavors
  # GET /endeavors.json
  def index
    @endeavors = if params[:tier_id]
      @tier = Tier.find params[:tier_id]
      @tier.endeavors
    elsif params[:member_id]
      @member = Member.find params[:member_id]
      @member.endeavors
    elsif params[:sub_club_id]
      @sub_club = SubClub.find params[:sub_club_id]
      @sub_club.endeavors
    else
      Endeavor.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @endeavors }
    end
  end

  # GET /endeavors/1
  # GET /endeavors/1.json
  def show
    @endeavor = Endeavor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @endeavor }
    end
  end

  # GET /endeavors/new
  # GET /endeavors/new.json
  def new
    @endeavor = Endeavor.new params[:endeavor]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @endeavor }
    end
  end

  # GET /endeavors/1/edit
  def edit
    @endeavor = Endeavor.find(params[:id])
  end

  # POST /endeavors
  # POST /endeavors.json
  def create
    @endeavor = Endeavor.new(params[:endeavor])
    @endeavor.member = current_member

    respond_to do |format|
      if @endeavor.save
        format.js
        format.html { redirect_to @endeavor.member, :notice => 'You rock.' }
        format.json { render :json => @endeavor, :status => :created, :location => @endeavor }
      else
        format.html { render :action => "new" }
        format.json { render :json => @endeavor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /endeavors/1
  # PUT /endeavors/1.json
  def update
    @endeavor = Endeavor.find(params[:id])

    respond_to do |format|
      if @endeavor.update_attributes(params[:endeavor])
        format.html { redirect_to @endeavor, :notice => 'Endeavor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @endeavor.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def sort
    @endeavors = Endeavor.find params[:endeavor]
    @endeavors.each do |endeavor|
      endeavor.position = params['endeavor'].index(endeavor.id.to_s) + 1
      endeavor.save
    end
    render :nothing => true
  end

  # DELETE /endeavors/1
  # DELETE /endeavors/1.json
  def destroy
    @endeavor = Endeavor.find(params[:id])
    @endeavor.destroy

    respond_to do |format|
      format.js
      format.html { redirect_to endeavors_url }
      format.json { head :no_content }
    end
  end
end
