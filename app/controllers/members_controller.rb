class MembersController < ApplicationController
  def show
    @member = Member.find params[:id]
  end
  
  def index
    @members = if params[:goal_id]
      @goal = Goal.find params[:goal_id]
      @goal.members
    elsif params[:sub_club_id]
      @sub_club = SubClub.find params[:sub_club_id]
      @sub_club.members
    else
      Member.all
    end
  end
end
