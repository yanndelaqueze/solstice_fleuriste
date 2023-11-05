class RenameTypeForCategory < ActiveRecord::Migration[7.1]
  def change
    remove_column :categories, :type
    add_column :categories, :product_type, :string, default: "Custom"
  end
end
