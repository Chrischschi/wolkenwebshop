class DestroyOldStuff < ActiveRecord::Migration
  def up
  		drop_table :produktes
  		drop_table :kundes
  		drop_table :bestandteile_bwa_bestandteiles
  		drop_table :bestandteiles 
  		drop_table :bestellung_besteht_aus_produktens
  		drop_table :bestellungs 

  end

  def down
  		raise ActiveRecord::IrreversibleMigration #die alten tabellen sollen nicht mehr zurückkommen
  end
end
