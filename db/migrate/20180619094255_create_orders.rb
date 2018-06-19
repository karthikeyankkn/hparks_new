class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id, limit: 8
      t.string :amount

      t.timestamps
    end
  end
end
