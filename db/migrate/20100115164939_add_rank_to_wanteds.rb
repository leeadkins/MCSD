class AddRankToWanteds < ActiveRecord::Migration
  def self.up
    add_column :wanteds, :rank, :integer
  end

  def self.down
    remove_column :wanteds, :rank
  end
end
