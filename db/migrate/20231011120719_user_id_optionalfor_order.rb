class UserIdOptionalforOrder < ActiveRecord::Migration[7.1]
  def change
    change_column :orders, :user_id, :integer, null: true
  end
end
