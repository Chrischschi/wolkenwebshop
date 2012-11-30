class ProduktKatalogController < ApplicationController
  def index
    @indexresult =  Parts.all
  end

  def search 
  	searchinput = params[:searchinput]

  	@searchresult = Parts.where("name LIKE '%#{searchinput}%'")
  end


end
