class SubClub < ActiveRecord::Base
  attr_accessible :description, :name
  
  has_many :memberships
  has_many :members, :through => :memberships
end
