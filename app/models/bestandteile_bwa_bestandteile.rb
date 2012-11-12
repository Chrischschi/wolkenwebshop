class BestandteileBwaBestandteile < ActiveRecord::Base
  attr_accessible :menge

  belongs_to :bestandteile
end
