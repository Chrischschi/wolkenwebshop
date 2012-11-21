class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
    	
       t.primary_key :id
      t.string :lStrasse
      t.integer :lPlz
      t.integer :lHausnr
      t.string :lOrt
      t.date :datum



      t.timestamps
    end
  end
end
