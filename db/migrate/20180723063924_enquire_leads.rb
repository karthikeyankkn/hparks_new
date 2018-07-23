class EnquireLeads < ActiveRecord::Migration[5.2]
  def change
  	create_table :enquire_leads do |t|
      t.string :from
      t.string :name
      t.string :email
      t.string :phone_number
      t.text :comments 	

      t.timestamps
    end
  end
end
