class AddDeliveryMessageToOrder < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :delivery_message_admin, :text, default: ""
  end
end
