class CreateUserDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :user_details do |t|
      t.string :name
      t.string :email
      t.string :plot_details
      t.integer :number
      t.boolean :payment_status,default: false

      t.timestamps
    end
  end
end
