class AddDeliveryNameToOrder < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :delivery_first_name, :string
    add_column :orders, :delivery_last_name, :string
  end
end
