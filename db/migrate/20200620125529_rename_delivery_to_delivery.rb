class RenameDeliveryToDelivery < ActiveRecord::Migration[5.2]
  def change
    rename_table :delivery, :deliveries
  end
end
