class CreateGalleryItems < ActiveRecord::Migration
  def self.up
    create_table :gallery_items do |t|
      t.references :event
      t.references :asset
      t.string :title
      t.string :description
      t.integer :views
    end
  end

  def self.down
    drop_table :gallery_items
  end
end
