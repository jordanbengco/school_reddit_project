class AddRenderTextToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :render_text, :text
  end
end
