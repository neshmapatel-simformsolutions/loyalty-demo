class Transaction < ApplicationRecord

  # Associations
  belongs_to :currency
  belongs_to :user
  belongs_to :product

  # Callbacks
  before_commit :add_transaction_details, :update_user_points_and_status

  def add_transaction_details
    self.amount = self.product.price * self.quantity
    self.value = "#{self.currency.code}" + "#{self.amount.to_f}"
    self.save!
  end

  def update_user_points_and_status
    user = self.user
    if self.amount >= 100
      points = user.currency == self.currency ? (self.amount/100).to_i * 10 : (self.amount/100).to_i * 20
      user.points = user.points.to_f + points
    end
    user.save!
  end
end
