class Article < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :dislikes, dependent: :destroy
    validates :title, presence: true, length: { minimum: 5 }
    validates :text, length: { maximum: 5000 }
    after_validation :set_slug, uniqueness: true, only: [:create, :update]

    default_scope { order('created_at DESC')}

    def to_param
    	"#{id}-#{slug}"
    end

  private

    def set_slug
    	self.slug = title.to_ascii.to_s.parameterize
    end
end