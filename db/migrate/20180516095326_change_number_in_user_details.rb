class ChangeNumberInUserDetails < ActiveRecord::Migration[5.2]
  def change
  	 change_column :user_details, :number, :integer, limit: 8
  end
end
