class Score < ActiveRecord::Base
  belongs_to :endeavor
  belongs_to :day
end
