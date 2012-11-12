class CreateBestellungBestehtAusProduktens < ActiveRecord::Migration
  def change
    create_table :bestellung_besteht_aus_produktens do |t|
      t.integer :stueckzahl
      t.decimal :preisBestellung

      t.timestamps
    end
  end
end
