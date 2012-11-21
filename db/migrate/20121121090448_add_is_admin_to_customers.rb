class AddIsAdminToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :isAdmin, :boolean
  end
end
