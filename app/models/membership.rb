class Membership < ActiveRecord::Base
  belongs_to :sub_club
  belongs_to :member
  # attr_accessible :title, :body
  
  acts_as_list :scope => :member
end
