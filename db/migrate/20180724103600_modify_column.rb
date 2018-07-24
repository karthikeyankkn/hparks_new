class ModifyColumn < ActiveRecord::Migration[5.2]
  def change
  	# rename_column :camp_leads, :from, :source
  	rename_column :enquire_leads, :from, :source
  end
end
