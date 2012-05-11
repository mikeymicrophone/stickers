class TierHousesController < ApplicationController
  # GET /tier_houses
  # GET /tier_houses.json
  def index
    @tier_houses = TierHouse.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tier_houses }
    end
  end

  # GET /tier_houses/1
  # GET /tier_houses/1.json
  def show
    @tier_house = TierHouse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tier_house }
    end
  end

  # GET /tier_houses/new
  # GET /tier_houses/new.json
  def new
    @tier_house = TierHouse.new params[:tier_house]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tier_house }
    end
  end

  # GET /tier_houses/1/edit
  def edit
    @tier_house = TierHouse.find(params[:id])
  end

  # POST /tier_houses
  # POST /tier_houses.json
  def create
    @tier_house = TierHouse.new(params[:tier_house])

    respond_to do |format|
      if @tier_house.save
        format.html { redirect_to @tier_house, notice: 'Tier house was successfully created.' }
        format.json { render json: @tier_house, status: :created, location: @tier_house }
      else
        format.html { render action: "new" }
        format.json { render json: @tier_house.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tier_houses/1
  # PUT /tier_houses/1.json
  def update
    @tier_house = TierHouse.find(params[:id])

    respond_to do |format|
      if @tier_house.update_attributes(params[:tier_house])
        format.html { redirect_to @tier_house, notice: 'Tier house was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tier_house.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tier_houses/1
  # DELETE /tier_houses/1.json
  def destroy
    @tier_house = TierHouse.find(params[:id])
    @tier_house.destroy

    respond_to do |format|
      format.html { redirect_to tier_houses_url }
      format.json { head :no_content }
    end
  end
end
