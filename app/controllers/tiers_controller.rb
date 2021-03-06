class TiersController < ApplicationController
  # GET /tiers
  # GET /tiers.json
  def index
    @tiers = if params[:member_id]
      @member = Member.find params[:member_id]
      @member.tiers.public_to(current_member)
    elsif params[:sub_club_id]
      @sub_club = SubClub.find params[:sub_club_id]
      @sub_club.tiers
    else
      Tier.all
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @tiers }
    end
  end

  # GET /tiers/1
  # GET /tiers/1.json
  def show
    @tier = Tier.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @tier }
    end
  end

  # GET /tiers/new
  # GET /tiers/new.json
  def new
    @tier = Tier.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @tier }
    end
  end

  # GET /tiers/1/edit
  def edit
    @tier = Tier.find(params[:id])
  end

  # POST /tiers
  # POST /tiers.json
  def create
    @tier = Tier.new(params[:tier])
    @tier.member = current_member

    respond_to do |format|
      if @tier.save
        if params[:endeavor_id]
          @tier.tierings.create :endeavor_id => params[:endeavor_id]
        end
        format.html { redirect_to @tier, :notice => "Your #{current_member.tiers.count.ordinalize} tier." }
        format.json { render :json => @tier, :status => :created, :location => @tier }
      else
        format.html { render :action => "new" }
        format.json { render :json => @tier.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def copy
    @tier = Tier.find params[:id]
    @copy = Tier.new @tier.attributes
    @copy.member = current_member
    @copy.save
    @tier.endeavors.each do |endeavor|
      current_member.endeavors.create(:goal_id => endeavor.goal_id).tierings.create(:tier => @copy)
    end
    redirect_to @copy
  end

  # PUT /tiers/1
  # PUT /tiers/1.json
  def update
    @tier = Tier.find(params[:id])

    respond_to do |format|
      if @tier.update_attributes(params[:tier])
        format.html { redirect_to @tier, :notice => 'Tier was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @tier.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def sort
    @tiers = Tier.find params[:tier]
    @tiers.each do |tier|
      tier.position = params['tier'].index(tier.id.to_s) + 1
      tier.save
    end
    render :nothing => true
  end  

  # DELETE /tiers/1
  # DELETE /tiers/1.json
  def destroy
    @tier = Tier.find(params[:id])
    @tier.destroy

    respond_to do |format|
      format.html { redirect_to tiers_url }
      format.json { head :no_content }
    end
  end
end
