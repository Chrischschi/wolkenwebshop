class Customer < ActiveRecord::Base
   attr_accessible :vorname,:name,:telnr,:email,:rOrt,:rPlz,:rHausNr,:rStr

   has_many :orders
   

end
