class AddDaysToRequests < ActiveRecord::Migration
  def self.up
    add_column :requests, :days, :integer
  end

  def self.down
  end
end
