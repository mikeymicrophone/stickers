class Membership < ActiveRecord::Base
  belongs_to :sub_club
  belongs_to :member
  
  acts_as_list :scope => :member
  
  scope :approved, :conditions => {:approved => true}
  scope :unapproved, :conditions => {:approved => nil}
  
  validates_uniqueness_of :sub_club_id, :scope => :member_id
  
  def approve!
    update_attribute :approved, true
  end
end
