class Score < ActiveRecord::Base
  belongs_to :endeavor
  has_one :goal, :through => :endeavor
  has_one :member, :through => :endeavor
  belongs_to :day
  has_many :details, :as => :target
  
  scope :recent, lambda { |num| where("date > ?", num.days.ago)}
  
  def name
    "#{mark} on #{goal.title}"
  end
end
