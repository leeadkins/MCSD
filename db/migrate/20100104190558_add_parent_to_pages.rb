class AddParentToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :parent, :integer
  end

  def self.down
    remove_column :pages, :parent
  end
end
