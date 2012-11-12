class Kunde < ActiveRecord::Base
  attr_accessible :email, :id, :name, :rHausnummer, :rOrt, :rPlz, :rStrasse, :telnr, :vorname

  has_many :bestellungs
end
