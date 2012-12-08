class KasseController < ApplicationController
  def index
  end

  def buy
		
   		lStrasse, lHnr,lPlz, lOrt  = params[:str] , params[:hnr] , params[:plz], params[:ort]
   		o = Order.new({:lStrasse => lStrasse,:datum => DateTime.current() ,:lOrt => lOrt,:lHausnr => lHnr,:lPlz => lPlz })
		o.save 
		
		preisBestellung = $warenkorbListe.reduce ( BigDecimal.new("0.0") ) {|accu,x| accu + x.preis }
		
		prodAnzahlHash = $warenkorbListe.reduce ( {} ) do |accu,prod|
			accu.has_key?(prod.name) ?  accu[prod.name] += 1 : accu[prod.name] = 1 ; accu 
		end 
		
		
		produkte = []
		prodAnzahlHash.each {|pname| produkte <<  Parts.find_by_name(pname) } 	
		
		produkte.each  do |produkt|
		
			c = OrdersConsistsOfParts.new({ :preisBestellung => produkt.preis , :stueckzahl => prodAnzahlHash[produkt.name] , :orderID => o.id, :partID => produkt.id }) 
			c.save 
		
		end 
		
		
		
		$warenkorbListe = []
		
  end
end
