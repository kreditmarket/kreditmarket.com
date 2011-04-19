class Debtor < ActiveRecord::Base
  
  define_index do 
    indexes full_name
    indexes birth_date
    indexes [pas_1, pas_2], :as => :pas
  end
end