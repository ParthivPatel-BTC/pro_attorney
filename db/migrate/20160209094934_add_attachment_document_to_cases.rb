class AddAttachmentDocumentToCases < ActiveRecord::Migration
  def self.up
    change_table :cases do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :cases, :document
  end
end
