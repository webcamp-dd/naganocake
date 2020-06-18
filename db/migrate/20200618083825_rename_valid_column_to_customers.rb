class RenameValidColumnToCustomers < ActiveRecord::Migration[5.2]
  def change
    rename_column :customers, :valid, :is_active
  end
end
