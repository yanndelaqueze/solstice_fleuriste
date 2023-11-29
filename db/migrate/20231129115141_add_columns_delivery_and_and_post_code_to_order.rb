class AddColumnsDeliveryAndAndPostCodeToOrder < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :in_delivery_area, :boolean, default: false
    add_column :orders, :town, :string, default: ""
  end
end
