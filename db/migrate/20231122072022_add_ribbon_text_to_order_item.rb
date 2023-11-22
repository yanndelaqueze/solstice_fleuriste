class AddRibbonTextToOrderItem < ActiveRecord::Migration[7.1]
  def change
    add_column :order_items, :ribbon_message, :string
  end
end
