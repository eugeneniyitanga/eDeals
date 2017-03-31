class RenameImageAndDeleteColumns < ActiveRecord::Migration[5.0]
  def change
     rename_column :products, :image1, :image
     remove_column :products, :image2, :string
     remove_column :products, :image3, :string
     remove_column :products, :image4, :string
     remove_column :products, :image5, :string
  end
end
