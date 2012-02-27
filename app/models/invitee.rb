class Invitee < ActiveRecord::Base
  belongs_to :invite
  has_one :inviter, :through => :invite, :source => :member
  
  before_create :generate_token
  after_create :deliver!
  
  def deliver!
    InviteeMailer.blank_invite(self).deliver
  end
  
  def generate_token
    self.confirmation_token = "iMlegit4stickers#{Time.now.to_i}yepletsgo"
  end
end
