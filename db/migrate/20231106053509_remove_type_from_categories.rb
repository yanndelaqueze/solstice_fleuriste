class RemoveTypeFromCategories < ActiveRecord::Migration[7.1]
  def change
    remove_column :categories, :product_type
  end
end
