class MembersController < ApplicationController
  def show
    @member = Member.find params[:id]
  end
  
  def index
    if params[:goal_id]
      @members = Goal.find(params[:goal_id]).members
    else
      @members = Member.all
    end
  end
end