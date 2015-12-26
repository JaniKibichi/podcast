class AddAttachmentEpisodeThumbnailToJourneys < ActiveRecord::Migration
  def self.up
    change_table :journeys do |t|
      t.attachment :episode_thumbnail
    end
  end

  def self.down
    remove_attachment :journeys, :episode_thumbnail
  end
end
