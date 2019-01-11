class User < ApplicationRecord
  include Clearance::User

  validates :email, format: {with: /@.+\...+/}
  validates :email, uniqueness: true
  validates :handle, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

end
