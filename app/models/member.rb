class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name
  
  has_many :endeavors
  has_many :goals, :through => :endeavors
  
  def score_for goal
    goal.endeavors.joins(:scores).sum(:mark)
  end
  
  def scored_days_for goal
    goal.endeavors.joins(:scores).count
  end
end
