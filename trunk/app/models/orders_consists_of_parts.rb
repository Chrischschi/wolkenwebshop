class OrdersConsistsOfParts < ActiveRecord::Base
  attr_accessible :preisBestellung, :stueckzahl
  set_table_name "orders_consists_of_parts" #migration ändern

  belongs_to :order
  belongs_to :parts
end
