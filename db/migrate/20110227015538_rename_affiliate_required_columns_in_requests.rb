class RenameAffiliateRequiredColumnsInRequests < ActiveRecord::Migration
  def self.up
  	rename_column :requests, :accepted, :is_accepted
  	rename_column :requests, :agent_paid, :is_agent_paid
  end

  def self.down
  end
end
