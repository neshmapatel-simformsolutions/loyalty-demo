class Currency < ApplicationRecord

  # Associations
	has_many :transactions
end
