class Comment < ApplicationRecord
  belongs_to :article
  validates :text, presence: true, length: { minimum: 3, maximum: 1000}
  default_scope { order('created_at DESC')}
end
