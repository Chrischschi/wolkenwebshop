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
        require 'debugger' ; debugger

    	eINE_WOCHE_SPAETER = 7 # einfach  Date + 7
    	orderDatum = order.datum

    	productsOfOrder.each do |produkt|
    	
   
    	createDemand(produkt,orderDatum + eINE_WOCHE_SPAETER)

    	# fulfillDemand(bedarf,orderDatum + EINE_WOCHE_SPAETER)
    	end 
    end	

    def createDemand(teil,datum)


       
            bedarf = Bedarf.new({:TNr => teil.id , :Datum => datum }) #losbildung für Aufträge mit selbem lieferdatum
             if !(Bedarf.exists?(:TNr => teil.id , :Datum => datum ) ) # wenn schon ein auftrag dafür existiert, dann braucht man keinen mehr. 
               bedarf.save  
             end

    	

    	fulfillDemand(bedarf,datum)

        bedarf ## Der Bedarf soll zurückkommen und ob die BedarfsDeckung erfolgreich gespeichert wurde! 


    end 	

    #Trägt Bedarfsdeckungen für teil an einem datum  ein. 
    def fulfillDemand(bedarf, datum)
    	auftrag = erstelleAuftrag(bedarf,datum)
    	
    	bedarfsDeckung = Bedarfsdeckung.new({ AuTNr:(auftrag.TNr) , BeTNr:(bedarf.TNr) , AuDatum:(auftrag.Datum) , BeDatum:(bedarf.Datum) })
    	    if !(Bedarfsdeckung.exists?( {
                    :AuTNr => (auftrag.TNr) , 
                    :BeTNr => (bedarf.TNr) ,
                    :AuDatum => (auftrag.Datum) ,
                    :BeDatum => (bedarf.Datum) }
                    ) 
                ) 
                bedarfsDeckung.save
            end     


    end	

    def erstelleAuftrag(auftrag,datum) #ist der parameter auftrag hier wirklich ein auftrag? 

    	auftrag = Auftrag.new({:TNr => auftrag.TNr, :Datum => datum}) 
        if !(Auftrag.exists?({:TNr =>  auftrag.TNr , :Datum => datum }))
    	auftrag.save
        end 
    	leiteBedarfeAb(auftrag,datum - 1 ) # Jetzt kommt die Vorlaufsverschiebung rein, beim ableiten von Bedarfen! 

    	auftrag 
    end 	

    def leiteBedarfeAb(auftrag, datum) 



    	unterteile = PartsConsistsOfParts.where(:oberteilID => auftrag.TNr) # Erst die Abfrage

        subParts = unterteile.reduce ([]) {|accu,elem| accu + [Parts.find(elem.unterteilID)] }

        puts "------------"
        puts "SubParts:"
        subParts.each  {|x| puts x.name  }
        puts "------------"

    	
        if (!unterteile.empty?)  
    	 
    		subParts.each do |t| 
                require "debugger"; debugger 
    			bedarf = createDemand(t, datum ) 

                puts "--------"
                puts "auftragTNr:"
                puts auftrag.TNr 
                puts "--------"

                

    			bedarfsAbleitung =  Bedarfsableitung.new({

                 :AuTNr => (auftrag.TNr) , 
                 :BeTNr => (bedarf.TNr) ,
                  :AuDatum => (auftrag.Datum) ,
                   :BeDatum => (bedarf.Datum) })

                if !(Bedarfsableitung.exists?( {
                    :AuTNr => (auftrag.TNr) , 
                    :BeTNr => (bedarf.TNr) ,
                    :AuDatum => (auftrag.Datum) ,
                    :BeDatum => (bedarf.Datum)
                     }) 
                    ) 

	    		bedarfsAbleitung.save
                end 
    		end	

        else return;     
    	end 	


        


    end 	
end
