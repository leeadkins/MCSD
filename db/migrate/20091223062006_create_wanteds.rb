class CreateWanteds < ActiveRecord::Migration
  def self.up
    create_table :wanteds do |t|
      t.string :lastname
      t.string :firstname
      t.string :alias
      t.string :race
      t.string :sex
      t.string :eyes
      t.string :hair
      t.string :height
      t.string :weight
      t.string :other
      t.string :marks
      t.string :charges

      t.timestamps
    end
  end

  def self.down
    drop_table :wanteds
  end
end
