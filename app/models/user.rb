class User < ApplicationRecord
  include Clearance::User

  enum role: [ :superadmin, :moderator, :customer ]

  validates :email, format: {with: /@.+\...+/}
  validates :email, uniqueness: true
  # validates :handle, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :authentications, dependent: :destroy
  has_many :listings
  has_many :reservations
  
  mount_uploader :avatar, AvatarUploader

  def self.create_with_auth_and_hash(authentication, auth_hash)
    user = self.create!(
      # byebug
      first_name: auth_hash["info"]["first_name"],
      last_name: auth_hash["info"]["last_name"],
      handle: auth_hash["info"]["name"],
      email: auth_hash["info"]["email"],
      avatar: auth_hash["info"]["image"],
      password: SecureRandom.hex(10)
    )
    user.authentications << authentication
    return user
  end


  # grab google to access google for user data
  def google_token
    x = self.authentications.find_by(provider: 'google_oauth2')
    return x.token unless x.nil?
  end


  #resize profile pictures
  # def thumbnail
  #   original = MiniMagick::Image.open(self.avatar.url)
  #   result = original.resize("100x100")
  #   return result
  # end



end
