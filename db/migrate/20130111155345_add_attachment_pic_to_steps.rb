class AddAttachmentPicToSteps < ActiveRecord::Migration
  def self.up
    change_table :steps do |t|
      t.attachment :pic
    end
  end

  def self.down
    drop_attached_file :steps, :pic
  end
end
