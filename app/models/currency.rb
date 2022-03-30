class Currency < ApplicationRecord

  # Associations
	has_many :transactions, dependent: :destroy
	has_many :users, dependent: :destroy
end
