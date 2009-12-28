class CreateOffenders < ActiveRecord::Migration
  def self.up
    create_table :offenders do |t|
      t.string :tid
      t.string :lastname
      t.string :firstname
      t.string :middle
      t.string :address
      t.string :city
      t.string :target

      t.timestamps
    end
  end

  def self.down
    drop_table :offenders
  end
end
