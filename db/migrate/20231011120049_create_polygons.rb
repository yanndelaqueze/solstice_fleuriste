class CreatePolygons < ActiveRecord::Migration[7.1]
  def change
    create_table :polygons do |t|
      t.string :name, default: "delivery_area"
      t.json :coordinates

      t.timestamps
    end
  end
end
