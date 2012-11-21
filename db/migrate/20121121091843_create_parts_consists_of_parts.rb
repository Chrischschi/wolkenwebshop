class CreatePartsConsistsOfParts < ActiveRecord::Migration
  def change
    create_table :parts_consists_of_parts do |t|

      t.integer :menge
      t.timestamps
    end
  end
end
