class MakeChangesToSellerProfile < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :user_id, :integer 
    add_column :products, :seller_profile_id, :integer
  end
end
