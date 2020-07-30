class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true
  validates :username, presence: true, uniqueness: true

  has_many :store_items, dependent: :destroy
  has_many :likes, dependent: :destroy
end
