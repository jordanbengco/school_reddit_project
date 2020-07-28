class AddTimeToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :time, :datetime
  end
end
