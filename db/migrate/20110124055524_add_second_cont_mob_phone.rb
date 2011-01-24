class AddSecondContMobPhone < ActiveRecord::Migration
  def self.up
    add_column :requests, :second_cont_per_mob_phone, :string
  end

  def self.down
  end
end
