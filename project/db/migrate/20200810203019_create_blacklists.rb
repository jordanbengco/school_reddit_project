class CreateBlacklists < ActiveRecord::Migration[6.0]
  def change
    create_table :blacklists do |t|
      t.string :blocked
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
