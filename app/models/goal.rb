class Goal < ActiveRecord::Base
  has_many :endeavors
  has_many :members, :through => :endeavors
end
