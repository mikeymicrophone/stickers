class Tiering < ActiveRecord::Base
  belongs_to :endeavor
  belongs_to :tier
  has_one :member, :through => :endeavor
  
  scope :for_tier, lambda { |tier| where(:tier_id => tier) }
  
  acts_as_list :scope => :tier_id
end
