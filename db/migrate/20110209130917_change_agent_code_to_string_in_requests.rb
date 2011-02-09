class ChangeAgentCodeToStringInRequests < ActiveRecord::Migration
  def self.up
    change_column :requests, :agent_code, :string
  end

  def self.down
  end
end
