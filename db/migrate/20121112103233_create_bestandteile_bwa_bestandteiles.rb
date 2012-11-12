class CreateBestandteileBwaBestandteiles < ActiveRecord::Migration
  def change
    create_table :bestandteile_bwa_bestandteiles do |t|
      t.integer :menge

      t.timestamps
    end
  end
end
