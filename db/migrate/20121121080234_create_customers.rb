class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|

	 t.primary_key :id
      t.string :name
      t.string :vorname
      t.integer :telnr
      t.string :email
      t.string :rStr
      t.integer :rPlz
      t.string :rOrt
      t.integer :rHausNr

      t.timestamps
    end
  end
end
