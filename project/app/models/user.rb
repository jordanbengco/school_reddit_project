class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true
  validates :username, presence: true, uniqueness: true
  after_validation :set_slug, uniqueness: true, only: [:create, :update]

  has_many :store_items, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :dislikes, dependent: :destroy

  # Allows messaging between users
  # Adds the mailbox methods (such as send, reply, etc)
  acts_as_messageable
  #profile picture
  mount_uploader :avatar, AvatarUploader
  validates_size_of :avatar, maximum: 2.megabytes, message: "Upload should be less than 2MB"
  def to_param
  	slug
  end

  private

  def set_slug
  	self.slug = username.to_ascii.to_s.parameterize
  end
end
