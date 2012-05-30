class AddTokenToRequests < ActiveRecord::Migration
  def self.up
    add_column :requests, :token, :string
  end

  def self.down
    remove_column :requests, :token
  end
end
