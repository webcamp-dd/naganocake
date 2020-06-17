class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id, foreign_key: true
      t.integer :postage
      t.integer :total_price
      t.integer :payment
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :status
      t.timestamps
    end
  end
end
