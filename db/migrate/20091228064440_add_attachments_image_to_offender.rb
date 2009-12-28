class AddAttachmentsImageToOffender < ActiveRecord::Migration
  def self.up
    add_column :offenders, :image_file_name, :string
    add_column :offenders, :image_content_type, :string
    add_column :offenders, :image_file_size, :integer
    add_column :offenders, :image_updated_at, :datetime
  end

  def self.down
    remove_column :offenders, :image_file_name
    remove_column :offenders, :image_content_type
    remove_column :offenders, :image_file_size
    remove_column :offenders, :image_updated_at
  end
end
