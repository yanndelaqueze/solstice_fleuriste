class RemovePostCodeFromOrder < ActiveRecord::Migration[7.1]
  def change
    remove_column :orders, :postcode
  end
end
