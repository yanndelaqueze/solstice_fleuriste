class ChangePriceForOrderItem < ActiveRecord::Migration[7.1]
  def change
    remove_column :order_items, :price
    add_monetize :order_items, :price, currency: { present: false }
  end
end
