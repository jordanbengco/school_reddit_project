class Article < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :dislikes, dependent: :destroy
    validates :title, presence: true, length: { minimum: 5 }
    validates :text, length: { maximum: 5000 }
    default_scope { order('created_at DESC')}
	has_rich_text :content
end
