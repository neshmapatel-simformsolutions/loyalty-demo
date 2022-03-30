class AddCurrencyToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :currency, foreign_key: true, null: false, index: true
  end
end
