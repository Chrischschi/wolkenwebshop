class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
    	
    	t.primary_key :id
    	t.decimal :preis
    	t.text :beschreibung
    	t.string :produktbild
    	t.string :name


      t.timestamps
    end
  end
end
