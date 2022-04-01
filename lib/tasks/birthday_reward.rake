namespace :birthday_reward do

  task reward_user_on_birthday: :environment do
    # Reward users during their birthday month
    User.where(
      "DATE_PART('month',birthdate) = ?", Date.today.month
    ).find_each do |user|
      UserReward.create(user_id: user.id, reward_id: Reward.find_by(name: "Birthday Reward").id)
      user.birthday_reward = true
      user.birthday_reward_collected_at = DateTime.now
      user.save!
    end
  end

end
