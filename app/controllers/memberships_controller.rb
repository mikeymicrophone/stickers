class MembershipsController < ApplicationController
  # GET /memberships
  # GET /memberships.json
  def index
    @memberships = if params[:sub_club_id]
      SubClub.find(params[:sub_club_id]).memberships
    else
      Membership.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @memberships }
    end
  end

  # GET /memberships/1
  # GET /memberships/1.json
  def show
    @membership = Membership.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @membership }
    end
  end

  # GET /memberships/new
  # GET /memberships/new.json
  def new
    @membership = Membership.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @membership }
    end
  end

  # GET /memberships/1/edit
  def edit
    @membership = Membership.find(params[:id])
  end

  # POST /memberships
  # POST /memberships.json
  def create
    @membership = Membership.new(params[:membership])
    @membership.member = current_member

    respond_to do |format|
      if @membership.save
        format.html { redirect_to sub_clubs_path, :notice => 'You requested membership.' }
        format.json { render :json => @membership, :status => :created, :location => @membership }
      else
        format.html { render :action => "new" }
        format.json { render :json => @membership.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /memberships/1
  # PUT /memberships/1.json
  def update
    @membership = Membership.find(params[:id])

    respond_to do |format|
      if @membership.update_attributes(params[:membership])
        format.html { redirect_to @membership, :notice => 'Membership was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @membership.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def approve
    @membership = Membership.find params[:id]
    if current_member.facilitates?(@membership.sub_club)
      @membership.approve!
    end
    
    respond_to do |format|
      format.js
    end
  end
  
  def sort
    @memberships = Membership.find params[:membership]
    @memberships.each do |membership|
      membership.position = params['membership'].index(membership.id.to_s) + 1
      membership.save
    end
    render :nothing => true
  end

  # DELETE /memberships/1
  # DELETE /memberships/1.json
  def destroy
    @membership = Membership.find(params[:id])
    @membership.destroy

    respond_to do |format|
      format.js
      format.html { redirect_to @membership.sub_club, :notice => 'you left:' }
      format.json { head :no_content }
    end
  end
end
