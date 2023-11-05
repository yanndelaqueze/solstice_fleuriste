class AddColumnsToShopStatus < ActiveRecord::Migration[7.1]
  def change
    add_column :shop_statuses, :active, :boolean, default: true
    add_column :shop_statuses, :message, :text, default: ""
  end
end
