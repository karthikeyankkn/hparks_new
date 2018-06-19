class AddOrderIdToUserDetail < ActiveRecord::Migration[5.2]
  def change
    add_column :user_details, :order_id, :integer, limit: 8
  end
end
