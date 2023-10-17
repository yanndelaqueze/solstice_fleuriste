class ChangeTotalPriceForOrder < ActiveRecord::Migration[7.1]
  def change
    remove_column :orders, :delivery_cost
    remove_column :orders, :subtotal
    remove_column :orders, :total
    add_monetize :orders, :delivery_cost, currency: { present: false }
    add_monetize :orders, :subtotal, currency: { present: false }
    add_monetize :orders, :total, currency: { present: false }
  end
end
