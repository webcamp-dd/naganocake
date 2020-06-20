class RenameValidColumnToProductCategories < ActiveRecord::Migration[5.2]
  def change
  	rename_column :product_categories, :valid, :is_active
  end
end
