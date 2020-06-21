class RenameUserIdColumnToCartProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :cart_products, :user_id, :customer_id
  end
end
