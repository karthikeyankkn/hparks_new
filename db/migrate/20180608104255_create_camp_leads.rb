class CreateCampLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :camp_leads do |t|
      t.string :from
      t.string :name
      t.string :email
      t.string :plot_size
      t.string :phone_number
      t.text :queries 	

      t.timestamps
    end
  end
end
