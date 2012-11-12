class AddProduktBildToProduktes < ActiveRecord::Migration
  def change
  	add_column :produktes, :produktbild, :string
  end
  
end
