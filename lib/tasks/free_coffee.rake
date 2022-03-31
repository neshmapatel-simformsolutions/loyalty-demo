namespace :free_coffee do
  task free_coffee_reward_at_end_of_month: :environment do

    # reward users with free coffee if 100 points are accumulated in a calendar month.
    User.includes(:transactions).where(transactions:
      {created_at: Date.today.beginning_of_month..Date.today.end_of_month}
    ).find_each(batch_size: 1000) do |user|

      # Calculate points of the transaction that has been created in a month and reward accordingly
      user.transactions.each do |transaction|
        points = transaction.calculate_points(user.currency == transaction.currency)

        if points > 100
          user.free_coffee_reward = true
          user.free_coffee_reward_collected_at = DateTime.now
          user.save!
        end
      end
    end
  end
end
