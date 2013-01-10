class CreateBedarves < ActiveRecord::Migration
  def change
    create_table :bedarves do |t|
      t.integer :TNr
      t.date :Datum

      t.timestamps
    end
  end
end
