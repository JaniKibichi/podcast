class AddAttachmentThumbnailToJourneys < ActiveRecord::Migration
  def self.up
    change_table :journeys do |t|
      t.attachment :thumbnail
    end
  end

  def self.down
    remove_attachment :journeys, :thumbnail
  end
end
