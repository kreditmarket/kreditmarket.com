class AddAgentCodeToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :agent_code, :string
  end

  def self.down
    remove_column :users, :agent_code
  end
end
