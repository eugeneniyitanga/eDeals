class RemoveImageAndChangeDescriptionToText < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :image, :string
    change_column :products, :description, :text

  end
end
