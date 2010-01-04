class AddAbscondedToOffenders < ActiveRecord::Migration
  def self.up
    add_column :offenders, :absconded, :boolean
  end

  def self.down
    remove_column :offenders, :absconded
  end
end
