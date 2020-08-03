class User < ApplicationRecord
  has_secure_password
  
  validates :email, presence: true
  validates :username, presence: true, uniqueness: true
  
  has_many :store_items, dependent: :destroy

  # Allows messaging between users
  # Adds the mailbox methods (such as send, reply, etc)
  acts_as_messageable

end
