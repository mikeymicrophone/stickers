class Membership < ActiveRecord::Base
  belongs_to :sub_club
  belongs_to :member
  
  acts_as_list :scope => :member
  
  scope :approved, :conditions => {:approved => true}
  scope :unapproved, :conditions => {:approved => nil}
  
  def approve!
    update_attribute :approved, true
  end
end
