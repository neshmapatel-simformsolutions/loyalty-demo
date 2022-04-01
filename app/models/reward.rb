class Reward < ApplicationRecord

  # Association
  has_many :user_rewards
  has_many :users, through: :user_rewards, dependent: :destroy
end
