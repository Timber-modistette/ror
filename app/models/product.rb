class Product < ActiveRecord::Base
  belongs_to :user
  has_many :buys, dependent: :destroy
  has_many :buyers, through: :buys, source: :user
end
