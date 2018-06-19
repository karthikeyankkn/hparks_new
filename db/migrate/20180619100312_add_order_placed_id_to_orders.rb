class AddOrderPlacedIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :order_placed_id, :integer,limit: 8
  end
end
