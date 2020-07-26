class CreateStoreItemListings < ActiveRecord::Migration[6.0]
  def change
    create_table :store_item_listings do |t|
      t.string :name
      t.text :description
      t.integer :cost

      t.timestamps
    end
  end
end
