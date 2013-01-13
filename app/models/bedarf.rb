class Bedarf < ActiveRecord::Base
  attr_accessible :Datum, :TNr, :anzahl
   set_table_name "bedarfs"
end
