
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
	 
	



end
