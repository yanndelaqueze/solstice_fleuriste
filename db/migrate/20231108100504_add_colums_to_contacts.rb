class AddColumsToContacts < ActiveRecord::Migration[7.1]
  def change
    add_column :contacts, :subject, :string
    add_column :contacts, :first_name, :string
    add_column :contacts, :last_name, :string
    add_column :contacts, :email, :string
    add_column :contacts, :phone, :string
    add_column :contacts, :address, :string
    add_column :contacts, :message, :text
  end
end
