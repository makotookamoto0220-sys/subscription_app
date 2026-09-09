class CreateSubscriptions < ActiveRecord::Migration[7.2]
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.integer :price
      t.string :payment_method
      t.integer :payment_day
      t.boolean :active
      t.string :category
      t.text :memo

      t.timestamps
    end
  end
end
