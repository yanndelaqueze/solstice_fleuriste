class AddOptionsCostToOrderItem < ActiveRecord::Migration[7.1]
  def change
    add_monetize :order_items, :options, currency: { present: false }
  end
end
