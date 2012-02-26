class Score < ActiveRecord::Base
  belongs_to :endeavor
  has_one :member, :through => :endeavor
  belongs_to :day
end
