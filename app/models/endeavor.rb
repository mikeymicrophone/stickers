class Endeavor < ActiveRecord::Base
  belongs_to :goal
  belongs_to :member
  has_many :scores, :dependent => :destroy
  has_many :details, :as => :target
  has_many :tierings, :dependent => :destroy
  has_many :tiers, :through => :tierings
  
  validates_uniqueness_of :goal_id, :scope => :member_id
  
  acts_as_list :scope => :member_id
  
  scope :not_in_tier, lambda { |tier| tier.endeavors.reject(&:new_record?).present? ? where(self.arel_table[:id].not_in(tier.endeavors.map(&:id).compact)) : {} }
  scope :by_member, lambda { |member| where(:member_id => member)}
  scope :public_to, lambda { |member| joins(:tierings).where("tier_id in (?)", Tier.public_to(member)) }
  
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
    scored_days_for.zero? ? 0 : (score/scored_days_for)*5.0
  end
  
  def average_last_7_days
    scored_days_for(7).zero? ? 0 : (score(7)/scored_days_for(7))*5.0
  end
  
  def tiering
    tierings.first
  end
  
  def tier
    tiers.first
  end
  
end
