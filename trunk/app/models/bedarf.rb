class Bedarf < ActiveRecord::Base
  attr_accessible :Datum, :TNr
  set_table_name "bedarfs" #!!!!
end
