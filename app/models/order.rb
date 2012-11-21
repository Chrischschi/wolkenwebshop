class Order < ActiveRecord::Base
   attr_accessible :id,:lStrasse,:datum,:lOrt,:lHausnr,:lPlz

   belongs_to :customer
   has_many :parts, :through => :orders_consists_of_parts 

end
