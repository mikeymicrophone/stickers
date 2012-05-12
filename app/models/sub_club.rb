class SubClub < ActiveRecord::Base
  attr_accessible :description, :name
  
  has_many :memberships
  has_many :members, :through => :memberships
  has_many :tier_houses
  has_many :tiers, :through => :tier_houses
  has_many :endeavors, :through => :tiers
  
  scope :without_tier, lambda { |tier| tier.tier_houses.present? ? where('id not in (?)', tier.tier_houses.map(&:sub_club_id)) : nil }
  scope :with_member, lambda { |member| member.memberships.present? ? where('id in (?)', member.memberships.map(&:sub_club_id)) : nil }
end
