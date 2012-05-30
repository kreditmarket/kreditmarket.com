class AddThirdContactPersonToRequests < ActiveRecord::Migration
  def self.up
    add_column :requests, :third_cont_per_first_name, :string
    add_column :requests, :third_cont_per_last_name, :string
    add_column :requests, :third_cont_per_surname, :string
    add_column :requests, :third_cont_per_relatives_level, :string
    add_column :requests, :third_cont_per_st_phone, :string
    add_column :requests, :third_cont_per_mob_phone, :string
  end

  def self.down
  end
end
