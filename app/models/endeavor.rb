class Endeavor < ActiveRecord::Base
  belongs_to :goal
  belongs_to :member
  has_many :scores
  
  def goal_name
    goal.title
  end
end
