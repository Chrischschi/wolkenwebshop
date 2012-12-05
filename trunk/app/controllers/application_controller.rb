class ApplicationController < ActionController::Base
  protect_from_forgery
  @warenkorbListe = [] # Integer Arrayliste der Produkt-ID's
end
