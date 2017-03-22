class SellerProfile < ApplicationRecord

  belongs_to :user, optional: true 
end
