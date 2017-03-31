class AddAttachmentImageToSellerProfiles < ActiveRecord::Migration
  def self.up
    change_table :seller_profiles do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :seller_profiles, :image
  end
end
