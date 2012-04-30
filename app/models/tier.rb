class Tier < ActiveRecord::Base
  has_many :tierings
  has_many :endeavors, :through => :tierings
  belongs_to :member
end
