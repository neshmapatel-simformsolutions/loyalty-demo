class Product < ApplicationRecord

  # Associations
  has_many :transactions
  has_many :users, through: :transactions

  enum category: %i[stationary gadget]
end
