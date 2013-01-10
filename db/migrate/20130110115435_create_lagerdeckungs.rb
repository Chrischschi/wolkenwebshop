class CreateLagerdeckungs < ActiveRecord::Migration
  def change
    create_table :lagerdeckungs do |t|
      t.integer :LNr
      t.integer :TNr
      t.date :Datum

      t.timestamps
    end
  end
end
