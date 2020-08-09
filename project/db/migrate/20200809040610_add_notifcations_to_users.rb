class AddNotifcationsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :notifications, :boolean
  end
end
