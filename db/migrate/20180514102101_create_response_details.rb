class CreateResponseDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :response_details do |t|

      t.timestamps
    end
  end
end
