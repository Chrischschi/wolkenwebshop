class Order < ActiveRecord::Base
   attr_accessible :id,:lStrasse,:datum,:lOrt,:lHausnr,:lPlz

   belongs_to :customer
   has_many :partss, :through => :orders_consists_of_parts #<- 's' muss noch geändert werden

end
