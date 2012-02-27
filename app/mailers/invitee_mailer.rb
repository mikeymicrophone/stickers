class InviteeMailer < ActionMailer::Base
  default :from => "stickerbot@gmail.com"
  
  def blank_invite invitee
    @inviter = invitee.inviter
    @invitee = invitee
    @message = @invitee.invite.message
    mail :to => invitee.email, :subject => "Join the Stickers Club"
  end
end