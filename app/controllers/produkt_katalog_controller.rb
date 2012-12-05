class ProduktKatalogController < ApplicationController
  def index
    @indexresult =  Parts.all
  end

  def search 
  	searchinput = params[:searchinput]

  	@searchresult = Parts.where("name LIKE '%#{searchinput}%'")
  end

  def add
    addinput = params[:addinput]
    
    @warenkorbListe << addinput
  end 

end
