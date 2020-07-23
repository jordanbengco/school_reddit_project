class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.text :email
      t.string :password_digest
      t.boolean :is_admin

      t.timestamps
    end
    add_index :users, :username, unique: true
  end
end
