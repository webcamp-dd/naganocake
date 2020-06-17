class CreateCartProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_products do |t|
      t.integer :user_id, foreign_key: true
      t.integer :product_id, foreign_key: true
      t.integer :quantity
      t.timestamps
    end
  end
end
