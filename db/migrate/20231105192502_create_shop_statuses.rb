class CreateShopStatuses < ActiveRecord::Migration[7.1]
  def change
    create_table :shop_statuses do |t|

      t.timestamps
    end
  end
end
