class Request < ActiveRecord::Base
	scope :accepted, :conditions => { :is_accepted => true }
	scope :unpaid, :conditions => { :is_agent_paid => false }

  belongs_to :creator, :class_name => 'User'

  before_create :generate_token
	
  validates :personal_last_name, :presence => true
  validates :personal_first_name, :presence => true
  validates :personal_surname, :presence => true
  validates :personal_mob_phone, :presence => true, :length => { :minimum => 7 }, :numericality => true

  def to_param
    self.token
  end

  private

  def generate_token
    self.token = Digest::SHA1.hexdigest([Time.now, rand].join)
  end
end
