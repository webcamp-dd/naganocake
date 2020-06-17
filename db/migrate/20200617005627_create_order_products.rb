class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.integer :order_id, foreign_key: true
      t.integer :product_id, foreign_key: true
      t.integer :quantity
      t.integer :purchase_unit_price
      t.integer :status

      t.timestamps
    end
  end
end
