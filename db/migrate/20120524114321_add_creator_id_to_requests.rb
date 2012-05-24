class AddCreatorIdToRequests < ActiveRecord::Migration
  def self.up
    add_column :requests, :creator_id, :integer
  end

  def self.down
    remove_column :requests, :creator_id
  end
end
