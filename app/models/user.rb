class User < ApplicationRecord

   has_many :products

  validates :password, length: { in: 6..20 } 
end
