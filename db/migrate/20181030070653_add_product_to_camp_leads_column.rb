class AddProductToCampLeadsColumn < ActiveRecord::Migration[5.2]
  def change
  	add_column :camp_leads, :product, :string
  end
end
