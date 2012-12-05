class CreateMayOrders < ActiveRecord::Migration
  def change
    create_table :may_orders, :id => false do |t|
    	t.integer :customerID
    	t.integer :orderID

      
    end

  end
end
