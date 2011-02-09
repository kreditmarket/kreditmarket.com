class AddAgentCodeToRequests < ActiveRecord::Migration
  def self.up
    add_column :requests, :agent_code, :integer
  end

  def self.down
    remove_column :requests, :agent_code
  end
end
