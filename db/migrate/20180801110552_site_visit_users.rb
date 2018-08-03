class SiteVisitUsers < ActiveRecord::Migration[5.2]
  def change
  	create_table :sitevisit_leads do |t|
      t.string :name
      t.string :email
      t.string :plot_details
      t.string :phone_number
      t.boolean :payment_status,default: false
      t.datetime :site_visit_date_time
      t.timestamps
    end
  end
end
