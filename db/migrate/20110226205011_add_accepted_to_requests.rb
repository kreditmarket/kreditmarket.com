class AddAcceptedToRequests < ActiveRecord::Migration
  def self.up
    add_column :requests, :accepted, :boolean, :default => false
  end

  def self.down
    remove_column :requests, :accepted
  end
end
