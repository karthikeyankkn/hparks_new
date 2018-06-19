class AddPaymentStatusToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :payment_status, :boolean,default: false
  end
end
