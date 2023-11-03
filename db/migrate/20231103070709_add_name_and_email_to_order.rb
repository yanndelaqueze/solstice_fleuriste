class AddNameAndEmailToOrder < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :first_name, :string, default: ""
    add_column :orders, :last_name, :string, default: ""
    add_column :orders, :email, :string, default: ""
  end
end
