class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#, :confirmable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :invitee_id
  
  has_many :endeavors, :order => :position
  has_many :goals, :through => :endeavors
  has_many :scores, :through => :endeavors
  has_many :tiers, :order => :position
  has_many :tierings, :through => :tiers
  has_many :memberships, :order => :position
  has_many :sub_clubs, :through => :memberships
  has_many :facilitations
  
  attr_accessor :invitee_id
  
  after_create :credit_invitee!
  
  def score_for goal
    goal.endeavors.where(:member_id => id).joins(:scores).sum(:mark)
  end
  
  def scored_days_for goal
    goal.endeavors.where(:member_id => id).joins(:scores).count
  end
  
  def credit_invitee!
    Invitee.find_by_id(invitee_id).andand.update_attribute :member_id, id
  end
  
  def is_a_member_of? sub_club
    memberships.approved.where(:sub_club_id => sub_club.id).first
  end
  
  def facilitates? sub_club
    facilitations.where(:sub_club_id => sub_club.id).first
  end
end
