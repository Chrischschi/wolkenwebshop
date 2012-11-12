class CreateProduktes < ActiveRecord::Migration
  def change
    create_table :produktes do |t|
      t.primary_key :id
      t.string :name

      t.timestamps
    end
  end
end
