class Tier < ActiveRecord::Base
  belongs_to :member
  has_many :tierings
  has_many :tierings, :order => :position
  has_many :endeavors, :through => :tierings
  has_many :tier_houses
  has_many :sub_clubs, :through => :tierhouses
  has_many :details, :as => :target
  
  acts_as_list :scope => :member_id
end
