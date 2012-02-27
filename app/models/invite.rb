class Invite < ActiveRecord::Base
  belongs_to :member
  has_many :invitees
  attr_accessor :emails
end
