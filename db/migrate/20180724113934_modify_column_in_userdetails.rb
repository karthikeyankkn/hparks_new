class ModifyColumnInUserdetails < ActiveRecord::Migration[5.2]
  def change
  	rename_column :user_details, :number, :phone_number
  end
end
