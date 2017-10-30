class AddAttachmentImageToOlders < ActiveRecord::Migration
  def self.up
    change_table :olders do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :olders, :image
  end
end
