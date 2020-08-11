class Article < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :dislikes, dependent: :destroy
    validates :title, presence: true, length: { minimum: 5 }
    validates :text, length: { maximum: 3000 }
    validates :category, presence: true
    after_validation :set_slug, uniqueness: true, only: [:create, :update]

    belongs_to :category

    def to_param
    	"#{id}-#{slug}"
    end

  private

    def set_slug
    	self.slug = title.to_ascii.to_s.parameterize
    end
end