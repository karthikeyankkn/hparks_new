class AddUserDetailIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :user_detail_id, :integer,limit: 8
  end
end
