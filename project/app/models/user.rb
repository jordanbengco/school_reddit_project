class User < ApplicationRecord
  has_secure_password
  
  validates :email, presence: true
  validates :username, presence: true, uniqueness: true
  after_validation :set_slug, uniqueness: true, only: [:create, :update]
  
  has_many :store_items, dependent: :destroy

  # Allows messaging between users
  # Adds the mailbox methods (such as send, reply, etc)
  acts_as_messageable

  def to_param
  	slug
  end

  private

  def set_slug
  	self.slug = username.to_ascii.to_s.parameterize
  end
end
