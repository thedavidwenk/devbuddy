class DropNoticedEventsTable < ActiveRecord::Migration[7.1]
  # def up
  #   drop_table :noticed_events
  # end

  def down
    create_table :noticed_events do |t|
      t.string :type
      t.string :record_type
      t.bigint :record_id
      t.jsonb :params
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.integer :notifications_count
      t.index [:record_type, :record_id], name: "index_noticed_events_on_record"
    end
  end
end
