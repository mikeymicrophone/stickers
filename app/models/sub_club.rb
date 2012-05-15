class SubClub < ActiveRecord::Base
  attr_accessible :description, :name
  
  has_many :facilitations
  has_many :facilitators, :through => :facilitations, :source => :member
  has_many :memberships
  has_many :members, :through => :memberships, :conditions => {:memberships => {:approved => true}}
  has_many :tier_houses
  has_many :tiers, :through => :tier_houses
  has_many :endeavors, :through => :tiers
  
  scope :without_tier, lambda { |tier| tier.tier_houses.reject(&:new_record?).present? ? where(self.arel_table[:id].not_in(tier.tier_houses.map(&:sub_club_id).compact)) : {} }
  scope :with_member, lambda { |member| where(self.arel_table[:id].in(member.memberships.map(&:sub_club_id))) }
  scope :randomized, order("rand()")
end
