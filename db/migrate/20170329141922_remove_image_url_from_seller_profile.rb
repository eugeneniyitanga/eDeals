class RemoveImageUrlFromSellerProfile < ActiveRecord::Migration[5.0]
  def change
  end
  remove_column :seller_profiles, :image_url, :string  
end
