class AddDateRemoveDayFromTimeslot < ActiveRecord::Migration[7.1]
  def change
    remove_column :time_slots, :day
    add_column :time_slots, :date, :date
  end
end
