class RemoveDaysAndTimeAvailabilityAndLocationFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :days_availability, :string
    remove_column :users, :time_availability, :string
    remove_column :users, :location, :string
  end
end
