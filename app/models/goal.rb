class Goal < ActiveRecord::Base
  has_many :endeavors
  has_many :members, :through => :endeavors
  
  scope :alphabetical, :order => 'title'
  scope :not_endeavored_upon_by, lambda { |member| where('id not in (?)', member.endeavors.map(&:goal_id)) }
end
