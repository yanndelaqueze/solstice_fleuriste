class AddTimeSlotToOrder < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :time_slot, :string, default: "Midi"
  end
end
