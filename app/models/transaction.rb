class Transaction < ApplicationRecord

  # Associations
  belongs_to :currency
  belongs_to :user
  belongs_to :product

  # Callbacks
  before_commit :add_transaction_details, :update_user_point

  def add_transaction_details
    self.amount = self.product.price * self.quantity
    self.value = "#{self.currency.code}" + "#{self.amount.to_f}"
    self.save!
  end

  def update_user_point
    user = self.user
    points = user.currency == self.currency ? (self.amount/10).to_f : ((self.amount/10) * 2).to_f
    user.points = user.points + points
    user.save!
  end
end
