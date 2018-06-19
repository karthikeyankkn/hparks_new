class RemoveOrderIdFromUserDetail < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_details, :order_id, :integer
  end
end
