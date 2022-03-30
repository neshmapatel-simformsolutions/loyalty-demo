class AddRewardsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :free_coffee_reward,   :boolean, default: false
    add_column :users, :movie_tickets_reward, :boolean, default: false
    add_column :users, :cash_rebate_reward,   :boolean, default: false
    add_column :users, :birthday_reward,      :boolean, default: false

    add_column :users, :free_coffee_reward_collected_at,   :datetime
    add_column :users, :movie_tickets_reward_collected_at, :datetime
    add_column :users, :cash_rebate_reward_collected_at,   :datetime
    add_column :users, :birthday_reward_collected_at,      :datetime

  end
end
