class Article < ApplicationRecord
  has_many :likes, dependent: :destroy
end
