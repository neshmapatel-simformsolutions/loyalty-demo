class UserReward < ApplicationRecord

  # Associations
  belongs_to :user
  belongs_to :reward
end
