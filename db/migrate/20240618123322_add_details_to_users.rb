class AddDetailsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :username, :string
    add_column :users, :avatar, :string
    add_column :users, :experience_level, :string
    add_column :users, :days_availability, :string
    add_column :users, :time_availability, :string
    add_column :users, :about_me, :text
    add_column :users, :programming_languages, :string
  end
end
