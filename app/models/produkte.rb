class Produkte < ActiveRecord::Base
  attr_accessible :id, :name, :produktbild

  has_and_belongs_to_many :bestandteiles
  has_many :bestellungs, :through => :bestellung_besteht_aus_produktens

  def to_s 
  	"Produkt:#{ name } , Bild:  #{ produktbild }"
  end

  

end
