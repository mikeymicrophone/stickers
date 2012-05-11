class TierHouse < ActiveRecord::Base
  belongs_to :sub_club
  belongs_to :tier
  # attr_accessible :title, :body
end
