class RemoveStartAndEndDateFromBookings < ActiveRecord::Migration[7.1]
  def change
    remove_column :bookings, :start_date, :date
    remove_column :bookings, :end_date, :date
  end
end
