module ABCAnalyse

	#ABC-Analyse so wie ich sie verstanden habe:
	#1. Material-liste wird nach wert sortiert (von max. zu min. preis)
	#2. wert aller gueter bestimmen
	#3. elemente werden in A eingefuegt, solange nicht 75% des wertes aller gueter erreicht wurde
	#4. elemente werden in B eingefuegt, solange nicht 92,5% des wertes aller gueter erreicht wurde
	#4. restliche elemente werden in C eingefügt

	#Parameter: 
	# liste:Array[Part]
	# return result:Hash{:A,:B,:C => ArrayA,ArrayB,ArrayC}
	def self.abc_analyse_parts (liste)

		#etwas defensiv programmiert 
		sortierteListe = liste.sort {|x,y| y.preis <=> x.preis} #vom groessten zum kleinsten 


		result = {:A => [], :B => [], :C => [] }
		summe = sortierteListe.reduce(0) {|accu,p| accu + p.preis} #alle gueter-preise aufsummieren 
		puts "Summe : #{summe}"
		prozent = 0.0 

		sortierteListe.each do |part|  
			anteil = (part.preis / summe) * 100 # prozentrechnung:  (Wert / Grundwert) * 100 
		   puts	"Anteil in Prozent : #{anteil}"
			prozent += anteil 
		 puts	"Prozentzahl #{prozent}"
			if (0.0...75.0).include?(prozent) then result[:A] << part  
				elsif (75.0...92.5).include?(prozent) then result[:B] << part  
				else result[:C] << part 
			end 
		end 

		result 	

	


    end 





	

end