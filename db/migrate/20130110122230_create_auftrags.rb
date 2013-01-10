class CreateAuftrags < ActiveRecord::Migration
  def change
    create_table :auftrags do |t|
      t.integer :TNr
      t.date :Datum

      t.timestamps
    end
  end
end
