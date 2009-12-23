class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :title
      t.string :menu
      t.string :slug
      t.text :body
      t.integer :rank

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
