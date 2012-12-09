 
# library-modul für Funktionen, welche Primärbedarfe ausrechnen 
module Primaerbedarfsanalyse


	#letzteBedarfe: Array[Integer]
	#return planBedarf: Integer
	def self.gleit_arith_mittel (letzteBedarfe)
																			# pbm = 
		planBedarf = letzteBedarfe.reduce (0) { |accu,b| accu + b  } 		# (bm-n+ bm-n+1+ ... bm-1) 
		(planBedarf / letzteBedarfe.length) 	
		#planBedarf.round											  		# / n 
	end 

	#letzterPB:Integer , letzterB:Integer, alpha:Float 
	#return planBedarf: Integer(aus gerundetem Float) oder doch lieber float? 
	def self.exp_glaettung (letzterPB, letzterB, alpha)   
		planBedarf = letzterPB +  alpha * (letzterB-letzterPB)

		planBedarf#.round
	end 	

end