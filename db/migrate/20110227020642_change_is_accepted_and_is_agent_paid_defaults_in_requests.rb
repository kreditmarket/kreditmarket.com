class ChangeIsAcceptedAndIsAgentPaidDefaultsInRequests < ActiveRecord::Migration
  def self.up
  	change_column_default :requests, :is_accepted, false
  	change_column_default :requests, :is_agent_paid, false
  end

  def self.down
  end
end
