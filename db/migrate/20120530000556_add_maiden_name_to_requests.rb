class AddMaidenNameToRequests < ActiveRecord::Migration
  def self.up
    add_column :requests, :maiden_name, :string
  end

  def self.down
    remove_column :requests, :maiden_name
  end
end
