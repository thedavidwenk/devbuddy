class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.text :note
      t.references :buddy1, null: false, foreign_key: { to_table: :users }
      t.references :buddy2, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end

