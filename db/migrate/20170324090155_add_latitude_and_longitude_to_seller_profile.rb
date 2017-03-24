class AddLatitudeAndLongitudeToSellerProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :seller_profiles, :latitude, :float 
    add_column :seller_profiles, :longitude, :float 
  end
end
