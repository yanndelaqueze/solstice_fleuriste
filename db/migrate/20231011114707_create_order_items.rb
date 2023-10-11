class CreateOrderItems < ActiveRecord::Migration[7.1]
  def change
    create_table :order_items do |t|
      t.references :product, null: false, foreign_key: true
      t.float :price
      t.references :order, null: false, foreign_key: true
      t.text :message
      t.string :color
      t.string :occasion
      t.timestamps
    end
  end
end
