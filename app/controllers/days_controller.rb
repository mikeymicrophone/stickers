class DaysController < ApplicationController
  # GET /days
  # GET /days.json
  def index
    @days = Day.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @days }
    end
  end

  # GET /days/1
  # GET /days/1.json
  def show
    @day = Day.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @day }
    end
  end

  # GET /days/new
  # GET /days/new.json
  def new
    @day = Day.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @day }
    end
  end

  # GET /days/1/edit
  def edit
    @day = Day.find(params[:id])
  end

  # POST /days
  # POST /days.json
  def create
    @day = Day.new(params[:day])

    respond_to do |format|
      if @day.save
        format.html { redirect_to @day, notice: 'Day was successfully created.' }
        format.json { render json: @day, status: :created, location: @day }
      else
        format.html { render action: "new" }
        format.json { render json: @day.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /days/1
  # PUT /days/1.json
  def update
    @day = Day.find(params[:id])

    respond_to do |format|
      if @day.update_attributes(params[:day])
        format.html { redirect_to @day, notice: 'Day was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @day.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /days/1
  # DELETE /days/1.json
  def destroy
    @day = Day.find(params[:id])
    @day.destroy

    respond_to do |format|
      format.html { redirect_to days_url }
      format.json { head :no_content }
    end
  end
end
