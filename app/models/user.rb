class User < ActiveRecord::Base
  include Clearance::User
  
  def full_name
    [last_name, first_name].join(' ')
  end
  
  def full_name=(name)
    split = name.split(' ', 2)
    self.first_name = split.last
    self.last_name = split.first
  end
end
