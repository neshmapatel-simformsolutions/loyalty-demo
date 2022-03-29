class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.decimal :price, default: 0.0
      t.integer :category, null: false

      t.timestamps
    end
  end
end
