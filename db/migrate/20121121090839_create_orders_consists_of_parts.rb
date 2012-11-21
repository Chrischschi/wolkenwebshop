class CreateOrdersConsistsOfParts < ActiveRecord::Migration
  def change
    create_table :orders_consists_of_parts do |t|

      t.integer :stueckzahl
      t.decimal :preisBestellung
      t.timestamps
    end
  end
end
