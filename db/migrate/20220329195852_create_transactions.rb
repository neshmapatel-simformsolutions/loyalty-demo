class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.decimal :amount
      t.string :value
      t.integer :quantity

      t.timestamps

      t.references :user,     null: false, foreign_key: true
      t.references :product,  null: false, foreign_key: true
      t.references :currency, null: false, foreign_key: true
    end
  end
end
