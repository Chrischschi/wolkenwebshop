class Bestellung < ActiveRecord::Base
  attr_accessible :datum, :id, :lHausnummer, :lOrt, :lPlz, :lStrasse

  belongs_to :kunde
  has_many :produktes, :through => :bestellung_besteht_aus_produktens 
end
