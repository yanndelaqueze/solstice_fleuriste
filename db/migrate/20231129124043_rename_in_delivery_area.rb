class RenameInDeliveryArea < ActiveRecord::Migration[7.1]
  def change
    rename_column :orders, :in_delivery_area?, :in_delivery_area
  end
end
