class RenameUserIdColumnToDeliveries < ActiveRecord::Migration[5.2]
  def change
    rename_column :deliveries, :user_id, :customer_id
  end
end
