class AddOptionsToOrderItems < ActiveRecord::Migration[7.1]
  def change
    add_column :order_items, :water_bubble, :boolean, default: false
    add_column :order_items, :ribbon, :boolean, default: false
  end
end
