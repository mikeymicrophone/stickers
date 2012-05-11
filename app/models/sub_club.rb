class SubClub < ActiveRecord::Base
  attr_accessible :description, :name
  
  has_many :memberships
  has_many :members, :through => :memberships
  has_many :tier_houses
  has_many :tiers, :through => :tier_houses
  
  scope :without_tier#, lambda { |tier| where('id not in (?)', tier.tier_houses.map(&:sub_club_id)) }
end
