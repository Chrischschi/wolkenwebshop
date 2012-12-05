class KasseController < ApplicationController
  def index
  end

  def buy
   		lStrasse, lHnr,lPlz, lOrt  = params[:str] , params[:hnr] , params[:plz], params[:ort]
   		puts "-----------------------------STRASSE:" + lStrasse
   		puts "--" + lHnr
   		puts "--" + lPlz
   		puts "--" + lOrt
  end
end
