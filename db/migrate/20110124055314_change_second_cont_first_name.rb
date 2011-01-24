class ChangeSecondContFirstName < ActiveRecord::Migration
  def self.up
    remove_column :requests, :second_cont_per_fist_name
    add_column :requests, :second_cont_per_first_name, :string    
  end

  def self.down
  end
end
