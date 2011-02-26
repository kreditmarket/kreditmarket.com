class ChangeAgentPaidInRequests < ActiveRecord::Migration
  def self.up
  	change_column_default :requests, :agent_paid, false
  end

  def self.down
  end
end
