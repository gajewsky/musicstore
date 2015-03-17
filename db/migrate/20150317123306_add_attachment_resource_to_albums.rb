class AddAttachmentResourceToAlbums < ActiveRecord::Migration
  def self.up
    change_table :albums do |t|
      t.attachment :resource
    end
  end

  def self.down
    remove_attachment :albums, :resource
  end
end
