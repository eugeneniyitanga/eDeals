class CreateSellerProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :seller_profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :location
      t.string :street_code
      t.text :image_url
      t.string :email 
      t.string :password_digest 

      t.timestamps
    end
  end
end
