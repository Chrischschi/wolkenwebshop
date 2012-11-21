class Parts < ActiveRecord::Base
  attr_accessible :preis,:id, :beschreibung,:produktbild,:name

  has_many :orders, :through => :orders_consists_of_parts
  has_many :parts, :through => :parts_consists_of_parts

end
