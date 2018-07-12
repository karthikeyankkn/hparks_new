class RenameColumnName < ActiveRecord::Migration[5.2]
  def change
  	rename_column :camp_leads, :from, :source
  end
end
