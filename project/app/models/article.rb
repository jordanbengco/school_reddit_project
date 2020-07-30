class Article < ApplicationRecord
    has_many :comments, dependent: :destroy
    validates :title, presence: true, length: { minimum: 5 }
    validates :text, length: { maximum: 5000 }
    default_scope { order('created_at DESC')}
end