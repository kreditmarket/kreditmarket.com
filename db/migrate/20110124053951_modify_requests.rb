class ModifyRequests < ActiveRecord::Migration
  def self.up
    add_column :requests, :is_as_reg, :boolean
    remove_column :requests, :fact_phone
  end

  def self.down
  end
end
