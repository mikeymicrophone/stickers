class SubClubsController < ApplicationController
  # GET /sub_clubs
  # GET /sub_clubs.json
  def index
    @sub_clubs = SubClub.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @sub_clubs }
    end
  end

  # GET /sub_clubs/1
  # GET /sub_clubs/1.json
  def show
    @sub_club = SubClub.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @sub_club }
    end
  end

  # GET /sub_clubs/new
  # GET /sub_clubs/new.json
  def new
    @sub_club = SubClub.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @sub_club }
    end
  end

  # GET /sub_clubs/1/edit
  def edit
    @sub_club = SubClub.find(params[:id])
  end

  # POST /sub_clubs
  # POST /sub_clubs.json
  def create
    @sub_club = SubClub.new(params[:sub_club])

    respond_to do |format|
      if @sub_club.save
        @membership = @sub_club.memberships.create :member => current_member
        @membership.approve!
        @sub_club.facilitations.create :member => current_member
        format.html { redirect_to @sub_club, :notice => 'Sub club was successfully created.' }
        format.json { render :json => @sub_club, :status => :created, :location => @sub_club }
      else
        format.html { render :action => "new" }
        format.json { render :json => @sub_club.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sub_clubs/1
  # PUT /sub_clubs/1.json
  def update
    @sub_club = SubClub.find(params[:id])

    respond_to do |format|
      if @sub_club.update_attributes(params[:sub_club])
        format.html { redirect_to @sub_club, :notice => 'Sub club was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @sub_club.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /sub_clubs/1
  # DELETE /sub_clubs/1.json
  def destroy
    @sub_club = SubClub.find(params[:id])
    @sub_club.destroy

    respond_to do |format|
      format.html { redirect_to sub_clubs_url }
      format.json { head :no_content }
    end
  end
end
