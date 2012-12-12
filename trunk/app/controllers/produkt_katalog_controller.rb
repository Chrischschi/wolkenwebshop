class ProduktKatalogController < ApplicationController
  def index
    @indexresult =  Parts.where(:isProduct => true)
  end

  def search 
  	searchinput = params[:searchinput]


  	@searchresult = Parts.where("name LIKE '%#{searchinput}%' AND isProduct = 't'")
  end

  def add
    addinput = params[:addinput]
    puts "WAS IM ADD-INPUT DRIN STEHT: #{addinput}"
    product =  Parts.find(addinput)
    name = product.name 
    preis = product.preis

    s = Struct.new("Ware",:name,:preis)
    elem = s.new(name,preis)
    
    $warenkorbListe << elem
  end 

  def delete
      deleteIndex = params[:deleteInput].to_i
      @deleted = $warenkorbListe.delete_at(deleteIndex)
   end 

end
