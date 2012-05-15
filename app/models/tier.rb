class Tier < ActiveRecord::Base
  belongs_to :member
  has_many :tierings, :order => :position
  has_many :endeavors, :through => :tierings
  has_many :tier_houses
  has_many :sub_clubs, :through => :tier_houses
  has_many :details, :as => :target
  
  acts_as_list :scope => :member_id
  
  scope :public_to, lambda { |member| joins(:sub_clubs).where("sub_club_id in (?)", member.memberships.map(&:sub_club_id)) }
end
