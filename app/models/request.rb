class Request < ActiveRecord::Base
  validates :personal_last_name, :presence => true
  validates :personal_first_name, :presence => true
  validates :personal_surname, :presence => true
  
end
