class ChangePriceToProduct < ActiveRecord::Migration[7.1]
  def change
    remove_column :products, :min_price
    add_monetize :products, :min_price, currency: { present: false }
  end
end
