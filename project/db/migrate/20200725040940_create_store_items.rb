class CreateStoreItems < ActiveRecord::Migration[6.0]
  def change
    create_table :store_items do |t|
      t.string :name
      t.text :description
      t.integer :cost
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
