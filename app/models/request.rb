class Request < ActiveRecord::Base
	scope :accepted, :conditions => { :is_accepted => true }
	scope :unpaid, :conditions => { :is_agent_paid => false }

  belongs_to :creator, :class_name => 'User'
	
  validates :personal_last_name, :presence => true
  validates :personal_first_name, :presence => true
  validates :personal_surname, :presence => true
  validates :personal_mob_phone, :presence => true, :length => { :minimum => 7 }, :numericality => true
end
