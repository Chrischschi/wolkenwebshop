class ProduktKatalogController < ApplicationController
  def index
    @indexresult =  Produkte.all
  end

  def search 
  	searchinput = params[:searchinput]

  	@searchresult = Produkte.where("name LIKE '%#{searchinput}%'")
  end


end
