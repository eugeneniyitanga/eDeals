class User < ApplicationRecord
  has_secure_password
has_many :products,    dependent: :destroy
has_many :comments
has_many :orders
has_one :seller_profile 
end
