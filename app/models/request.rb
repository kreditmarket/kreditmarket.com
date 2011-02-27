class Request < ActiveRecord::Base
	scope :accepted, :conditions => { :is_accepted => true }
	scope :unpaid, :conditions => { :is_agent_paid => false }
	
  validates :personal_last_name, :presence => true
  validates :personal_first_name, :presence => true
  validates :personal_surname, :presence => true
  
end
