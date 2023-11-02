class AddDefaultValuesToOrderFields < ActiveRecord::Migration[7.1]
  def change
      change_column :orders, :phone, :string, default: ""
      change_column :orders, :delivery_first_name, :string, default: ""
      change_column :orders, :delivery_last_name, :string, default: ""
      change_column :orders, :delivery_instructions, :string, default: ""
  end
end
