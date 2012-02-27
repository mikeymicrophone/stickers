class InviteesController < ApplicationController
  # GET /invitees
  # GET /invitees.json
  def index
    @invitees = Invitee.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @invitees }
    end
  end

  # GET /invitees/1
  # GET /invitees/1.json
  def show
    @invitee = Invitee.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @invitee }
    end
  end

  # GET /invitees/new
  # GET /invitees/new.json
  def new
    @invitee = Invitee.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invitee }
    end
  end

  # GET /invitees/1/edit
  def edit
    @invitee = Invitee.find(params[:id])
  end

  # POST /invitees
  # POST /invitees.json
  def create
    @invitee = Invitee.new(params[:invitee])

    respond_to do |format|
      if @invitee.save
        format.html { redirect_to @invitee, notice: 'Invitee was successfully created.' }
        format.json { render json: @invitee, status: :created, location: @invitee }
      else
        format.html { render action: "new" }
        format.json { render json: @invitee.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def confirmation
    @invitee = Invitee.find params[:id]
    debugger
    if @invitee.confirmation_token == params[:token]
      redirect_to new_member_registration_path :invitee_id => params[:id]
    else
      redirect_to new_member_registration_path
    end
  end

  # PUT /invitees/1
  # PUT /invitees/1.json
  def update
    @invitee = Invitee.find(params[:id])

    respond_to do |format|
      if @invitee.update_attributes(params[:invitee])
        format.html { redirect_to @invitee, notice: 'Invitee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @invitee.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /invitees/1
  # DELETE /invitees/1.json
  def destroy
    @invitee = Invitee.find(params[:id])
    @invitee.destroy

    respond_to do |format|
      format.html { redirect_to invitees_url }
      format.json { head :no_content }
    end
  end
end
