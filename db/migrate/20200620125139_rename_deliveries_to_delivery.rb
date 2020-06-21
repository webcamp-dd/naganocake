class RenameDeliveriesToDelivery < ActiveRecord::Migration[5.2]
  def change
    rename_table :deliveries, :delivery
  end
end
