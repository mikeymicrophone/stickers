class Goal < ActiveRecord::Base
  has_many :endeavors, :dependent => :destroy
  has_many :members, :through => :endeavors
  has_many :details, :as => :target
  
  scope :alphabetical, :order => 'title'
  scope :not_endeavored_upon_by, lambda { |member| where('id not in (?)', member.endeavors.map(&:goal_id)) }
  
  alias_attribute :name, :title
end
