class AddBossPhoneToRequests < ActiveRecord::Migration
  def self.up
    add_column :requests, :inc_org_boss_phone, :string
  end

  def self.down
    remove_column :requests, :inc_org_boss_phone
  end
end
