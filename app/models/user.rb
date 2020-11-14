class User < ApplicationRecord
  has_secure_password
  validates :username, :email, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :items, foreign_key: :user_id, dependent: :destroy
end
