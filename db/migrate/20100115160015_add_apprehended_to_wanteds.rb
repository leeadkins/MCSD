class AddApprehendedToWanteds < ActiveRecord::Migration
  def self.up
    add_column :wanteds, :apprehended, :boolean
  end

  def self.down
    remove_column :wanteds, :apprehended
  end
end
