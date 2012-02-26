class Endeavor < ActiveRecord::Base
  belongs_to :goal
  belongs_to :member
  has_many :scores
  
  def goal_name
    goal.title
  end
  
  def score days = nil
    if days
      scores.recent(days).sum(:mark)
    else
      scores.sum(:mark)
    end
  end
  
  def scored_days_for days = nil
    if days
      scores.recent(days).count
    else
      scores.count
    end
  end
  
  def average
    (score/scored_days_for)*5.0
  end
  
  def average_last_7_days
    (score(7)/scored_days_for(7))*5.0
  end
  
end
