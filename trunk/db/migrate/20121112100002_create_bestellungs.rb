class CreateBestellungs < ActiveRecord::Migration
  def change
    create_table :bestellungs do |t|
      t.primary_key :id
      t.string :lStrasse
      t.integer :lPlz
      t.integer :lHausnummer
      t.string :lOrt
      t.date :datum

      t.timestamps
    end
  end
end
