class AddAgentPaidToRequests < ActiveRecord::Migration
  def self.up
    add_column :requests, :agent_paid, :boolean
  end

  def self.down
    remove_column :requests, :agent_paid
  end
end
