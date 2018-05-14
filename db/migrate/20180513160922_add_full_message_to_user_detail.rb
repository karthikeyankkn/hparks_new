class AddFullMessageToUserDetail < ActiveRecord::Migration[5.2]
  def change
    add_column :user_details, :full_message, :text
  end
end
