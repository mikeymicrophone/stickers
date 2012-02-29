class Endeavor < ActiveRecord::Base
  belongs_to :goal
  belongs_to :member
  has_many :scores
  has_many :details, :as => :target
  
  validates_uniqueness_of :goal_id, :scope => :member_id
  
  def goal_name
    goal.title
  end
  
  def name
    "#{member.first_name}/#{goal_name}"
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
    (score/scored_days_for)*5.0 unless scored_days_for.zero?
  end
  
  def average_last_7_days
    (score(7)/scored_days_for(7))*5.0 unless scored_days_for(7).zero?
  end
  
end
