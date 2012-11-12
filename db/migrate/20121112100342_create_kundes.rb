class CreateKundes < ActiveRecord::Migration
  def change
    create_table :kundes do |t|
      t.primary_key :id
      t.string :name
      t.string :vorname
      t.integer :telnr
      t.string :email
      t.string :rStrasse
      t.integer :rPlz
      t.string :rOrt
      t.integer :rHausnummer

      t.timestamps
    end
  end
end
