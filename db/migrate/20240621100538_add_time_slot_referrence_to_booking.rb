class AddTimeSlotReferrenceToBooking < ActiveRecord::Migration[7.1]
  def change
    add_reference :bookings, :time_slot, null: false, foreign_key: true
  end
end
