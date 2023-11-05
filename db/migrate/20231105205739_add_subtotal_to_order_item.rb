class AddSubtotalToOrderItem < ActiveRecord::Migration[7.1]
  def change
    add_monetize :order_items, :subtotal, currency: { present: false }
  end
end
