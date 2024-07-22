class CreateTimeSlots < ActiveRecord::Migration[7.1]
  def change
    create_table :time_slots do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :day
      t.time :start_time
      t.time :end_time
      t.boolean :reserved

      t.timestamps
    end
  end
end
