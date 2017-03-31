class Product < ApplicationRecord
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :image, attachment_presence: true
  validates_with AttachmentPresenceValidator, attributes: :image
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 2.megabytes


  has_many :comments, dependent: :destroy 
  belongs_to :seller_profile, optional:true 
  has_many :carted_products
  has_many :orders, through: :carted_products
  has_many :categories

   def tax 
    return price * 0.09
  end 
end
