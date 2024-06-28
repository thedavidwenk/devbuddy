class ChangeDateTimeToTimeDatatypeInTimeSlots < ActiveRecord::Migration[7.1]
  def change
    # Remove the old columns
    remove_column :time_slots, :start_time, :datetime
    remove_column :time_slots, :end_time, :datetime

    # Add the new columns with the correct data type
    add_column :time_slots, :start_time, :time
    add_column :time_slots, :end_time, :time
  end
end
