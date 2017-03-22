class RemoveColumnsFromSellerProfiles < ActiveRecord::Migration[5.0]
  def change

    remove_column :seller_profiles, :password_digest, :string 
    rename_column :seller_profiles, :first_name, :company_name 
    remove_column :seller_profiles, :last_name, :string 
    rename_column :seller_profiles, :email, :company_email 
  end
end
