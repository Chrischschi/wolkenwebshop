 
# library-modul für Funktionen, welche Primärbedarfe ausrechnen 
module Primaerbedarfsanalyse

	def self.gleit_arith_mittel (letzteBedarfe)
																			# pbm = 
		planBedarf = letzteBedarfe.reduce (0) { |accu,b| accu + b  } 		# (bm-n+ bm-n+1+ ... bm-1) 
		planBedarf / letzteBedarfe.length 							  		# / n 
	end 

end