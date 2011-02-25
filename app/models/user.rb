class User < ActiveRecord::Base
  include Clearance::User
  
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  
  def full_name
    [last_name, first_name].join(' ')
  end
  
  def full_name=(name)
    split = name.split(' ', 2)
    self.first_name = split.last
    self.last_name = split.first
  end
  
	def random_string(length=5)
		chars = 'abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ23456789'
		password = ''
		length.times { password << chars[rand(chars.size)] }
		password
	end
end
