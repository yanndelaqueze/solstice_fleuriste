class ChangeDeliveryPossibleColumn < ActiveRecord::Migration[7.1]
  def change
    rename_column :orders, :delivery_possible, :in_delivery_area?
  end
end
