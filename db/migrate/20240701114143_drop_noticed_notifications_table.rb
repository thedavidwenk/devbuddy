class DropNoticedNotificationsTable < ActiveRecord::Migration[7.1]
  # def up
  #   drop_table :noticed_notifications
  # end

  def down
    create_table :noticed_notifications do |t|
      t.string :type
      t.bigint :event_id, null: false
      t.string :recipient_type, null: false
      t.bigint :recipient_id, null: false
      t.datetime :read_at
      t.datetime :seen_at
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.index [:event_id], name: "index_noticed_notifications_on_event_id"
      t.index [:recipient_type, :recipient_id], name: "index_noticed_notifications_on_recipient"
    end
  end
end
