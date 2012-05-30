class ChangeMaidenNameToPersonalMaidenNameInRequests < ActiveRecord::Migration
  def self.up
    rename_column :requests, :maiden_name, :personal_maiden_name
  end

  def self.down
  end
end
