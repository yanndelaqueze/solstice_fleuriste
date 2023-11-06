class AddPostcodeToOrder < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :postcode, :string, default: ""
  end
end
