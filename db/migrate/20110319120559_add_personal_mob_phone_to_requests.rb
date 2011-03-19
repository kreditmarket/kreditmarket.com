class AddPersonalMobPhoneToRequests < ActiveRecord::Migration
  def self.up
    add_column :requests, :personal_mob_phone, :string
  end

  def self.down
  end
end
