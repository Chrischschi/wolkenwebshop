
require './app/controllers/usermodules/primaerBedarfsAnalyse.rb'
require './app/controllers/usermodules/ABC-Analyse.rb'

class UserController < ApplicationController
	def index 
	end 

	def pba

	end 

	def erg_expgl 

	  @e_expgl = Primaerbedarfsanalyse.exp_glaettung(params[:lPB].to_i,params[:lB].to_i,params[:alpha].to_f)
	end 

	def erg_gam
		@e_gam = Primaerbedarfsanalyse.gleit_arith_mittel([params[:b1].to_i,params[:b2].to_i,params[:b3].to_i])
	end
	
	def abc_an 
	
	end

	def erg_abc_an
	 gueter = Parts.where(:isProduct => false ) 
	 @e_abc_an =  ABCAnalyse.abc_analyse_parts(gueter) 
	end 

	def stueckliste
		
	end 

	def erg_stueckliste
	 id = Parts.find_by_name(params[:produktname]).id
	  @e_stueckliste = 	stueckliste_aufloesen(id)
	end

	def auftragsverfolgung
			@auftraege = Auftrag.all
			@bedarfe = Bedarf.all 
			@ableitungen = Bedarfsableitung.all
			@deckungen = Bedarfsdeckung.all 

    end 
	private

	def stueckliste_aufloesen(teilID)
		result = {} 
		part = Parts.find(teilID) 
		name = part.name 
		result[name] = []
		subparts = PartsConsistsOfParts.where(:oberteilID => teilID)

		if subparts.empty? then return {name => nil}
		else 
			     	subparts.each do |elem| 
				result[name] << [ elem.menge , Parts.find(elem.unterteilID).name ] 
				puts  "" + result[name].to_s 
				end 

			subparts_structure = subparts.reduce ({})  do |accu,element| 

					
				        accu.merge(stueckliste_aufloesen(element.unterteilID)) 
					

			    end	

				#subparts.each do |element|
			#		result.merge(stueckliste_aufloesen(element.unterteilID))
			#	end
			result.merge(subparts_structure) 
			
		end

		#15.1.2013: Auftragsverfolgung hinzufügen 

		
		
	end  


end
