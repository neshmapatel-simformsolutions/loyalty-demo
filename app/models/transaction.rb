class Transaction < ApplicationRecord

  # Associations
  belongs_to :currency
  belongs_to :user
  belongs_to :product

  # Callbacks
  before_commit :add_transaction_details
  after_save :update_user_point

  def add_transaction_details
    self.amount = self.product.price * self.quantity
    self.value = "#{self.amount.to_f}" + "#{self.currency.code}"
    self.save!
  end

  def update_user_point
    user = self.user
    points = (user.transactions.sum(:amount)/10).to_f
    user.save!
  end
end
