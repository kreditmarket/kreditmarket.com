class AddIsMiniToRequests < ActiveRecord::Migration
  def self.up
    add_column :requests, :is_mini, :boolean, :default => false
  end

  def self.down
    remove_column :requests, :is_mini
  end
end
