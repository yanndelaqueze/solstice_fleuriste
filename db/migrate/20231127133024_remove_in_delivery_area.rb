class RemoveInDeliveryArea < ActiveRecord::Migration[7.1]
  def change
    remove_column :orders, :in_delivery_area?
  end
end
