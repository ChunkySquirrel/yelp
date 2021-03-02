class AddAttachmentImageToReviews < ActiveRecord::Migration[6.0]
  def self.up
    change_table :reviews do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :reviews, :image
  end
end
