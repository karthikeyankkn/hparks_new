class LinkdinCampaign < ActiveRecord::Migration[5.2]
  def change
  	create_table :linkdin_leads do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :work_phone_number 	
      t.datetime :site_visit_date
      t.string :company_name
      t.string :designation
      t.timestamps
    end
  end
end
