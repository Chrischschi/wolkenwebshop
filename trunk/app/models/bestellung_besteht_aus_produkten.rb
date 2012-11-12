class BestellungBestehtAusProdukten < ActiveRecord::Base
  attr_accessible :preisBestellung, :stueckzahl

  belongs_to :bestellung 
  belongs_to :produkt

  
end
