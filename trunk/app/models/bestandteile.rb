class Bestandteile < ActiveRecord::Base
  attr_accessible :id, :name, :preis

  has_and_belongs_to_many :produktes

  has_many :bestandteiles, :through => :bestandteile_bwa_bestandteiles
  

end
