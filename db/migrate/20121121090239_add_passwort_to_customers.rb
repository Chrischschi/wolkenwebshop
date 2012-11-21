class AddPasswortToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :passwort, :string
  end
end
