class User < ActiveRecord::Base
  include Clearance::User
  
  ROLES = %w[admin moderator author banned]
  
  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end
  
  def roles
    ROLES.reject do |r|
      ((roles_mask || 0) & 2**ROLES.index(r)).zero?
    end
  end
  
  def is?(role)
    roles.include?(role.to_s)
  end
  
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
