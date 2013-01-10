class CreateLagers < ActiveRecord::Migration
  def change
    create_table :lagers do |t|
      t.integer :LNr
      t.integer :TNr

      t.timestamps
    end
  end
end
