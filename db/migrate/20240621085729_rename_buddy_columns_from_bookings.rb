class RenameBuddyColumnsFromBookings < ActiveRecord::Migration[7.1]
  def change
    # Rename columns
    rename_column :bookings, :buddy1_id, :user_id
    rename_column :bookings, :buddy2_id, :booker_id
  end
end
