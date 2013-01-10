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
		

		trackOrder(o,produkte) 
		
		
		$warenkorbListe = []

  end
  	#Trägt bestellung in Auftragsverfolgung ein
    def trackOrder(order,productsOfOrder)
    	EINE_WOCHE_SPÄTER = 7 # einfach  Date + 7
    	orderDatum = order.datum

    	productsOfOrder.each do |produkt|
    	
   
    	createDemand(order,orderDatum + EINE_WOCHE_SPÄTER)

    	# fulfillDemand(bedarf,orderDatum + EINE_WOCHE_SPÄTER)
    	end 
    end	

    def createDemand(teil,datum)
    	bedarf = Bedarf.new({:TNr => teil.id , :Datum => datum }) #losbildung für Aufträge mit selbem lieferdatum
    	bedarf.save

    	fulfillDemand(bedarf,datum)
    end 	

    #Trägt Bedarfsdeckungen für teil an einem datum  ein. 
    def fulfillDemand(bedarf, datum)
    	auftrag = erstelleAuftrag(bedarf,datum)
    	
    	bedarfsDeckung = BedarfsDeckung.new({ AuTNr:(auftrag.TNr) , BeTNr:(bedarf.TNr) , AuDatum:(auftrag.Datum) , BeDatum:(bedarf.Datum) })
    	bedarfsDeckung.save



    end	

    def erstelleAuftrag(auftrag,datum)
    	auftrag = Auftrag.new({:TNr => auftrag.TNr, :Datum => datum}) 
    	auftrag.save

    	leiteBedarfeAb(auftrag,datum - 1 ) # Jetzt kommt die Vorlaufsverschiebung rein, beim ableiten von Bedarfen! 

    	auftrag 
    end 	

    def leiteBedarfeAb(auftrag, datum) 



    	unterteile = PartsConsistsOfParts.where(:oberteilID => auftrag.TNr)

    #	if (unterteile.empty?) then return; 
    #	else 
    		unterteile.each do |t| 
    			bedarf = createDemand(t, datum ) 
    			bedarfsAbleitung =  BedarfsAbleitung.new({ AuTNr:(auftrag.TNr) , BeTNr:(bedarf.TNr) , AuDatum:(auftrag.Datum) , BeDatum:(bedarf.Datum) })

	    		bedarfsAbleitung.save

    		end	
    #	end 	


    


    end 	
end
