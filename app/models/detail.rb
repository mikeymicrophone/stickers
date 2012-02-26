class Detail < ActiveRecord::Base
  belongs_to :target, :polymorphic => true
  belongs_to :member
  
  mount_uploader :payload, PayloadUploader
end
