class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :product_category_id, foreign_key: true
      t.string :name
      t.text :description
      t.integer :unit_price
      t.string :product_image_id
      t.boolean :sales_status

      t.timestamps
    end
  end
end
