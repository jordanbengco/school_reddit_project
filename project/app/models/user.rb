class User < ApplicationRecord
  has_secure_password
  
  validates :email, presence: true
  validates :username, presence: true, uniqueness: true
  
  # Adds the mailbox methods (such as send, reply, etc)
  has_many :store_items, dependent: :destroy

  # Allows messaging between users
  acts_as_messageable
  
end
