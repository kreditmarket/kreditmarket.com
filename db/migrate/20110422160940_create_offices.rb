class CreateOffices < ActiveRecord::Migration
  def self.up
    create_table :offices do |t|
      t.string :slug
      t.string :address
      t.string :phone
      t.text :description
      t.text :map
      t.string :mode

      t.timestamps
    end
  end

  def self.down
    drop_table :offices
  end
end
