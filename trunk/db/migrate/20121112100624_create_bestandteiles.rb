class CreateBestandteiles < ActiveRecord::Migration
  def change
    create_table :bestandteiles do |t|
      t.primary_key :id
      t.string :name
      t.decimal :preis


      t.timestamps
    end


  end
end
