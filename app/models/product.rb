class Product < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :images 
  belongs_to :user, optional:true 
  has_many :carted_products
  has_many :orders, through: :carted_products

   def tax 
    return price * 0.09
  end 
end
