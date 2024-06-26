class ChangeTimeToDateTimeInTimeSlots < ActiveRecord::Migration[7.1]
  def change
    # Remove the old columns
    remove_column :time_slots, :start_time, :time
    remove_column :time_slots, :end_time, :time

    # Add the new columns with the correct data type
    add_column :time_slots, :start_time, :datetime
    add_column :time_slots, :end_time, :datetime
  end
end
