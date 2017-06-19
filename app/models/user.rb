class User < ActiveRecord::Base
  has_secure_password
  has_many :products, dependent: :destroy
  has_many :buys, dependent: :destroy
  has_many :products_bought, through: :buys, source: :product

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :first_name, :last_name, presence: true
  validates :password, length: { in: 8..10}, on: :create
end
