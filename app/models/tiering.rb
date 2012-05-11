class Tiering < ActiveRecord::Base
  belongs_to :endeavor
  belongs_to :tier
  has_one :member, :through => :endeavor
end
