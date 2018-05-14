class CreatePlotSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :plot_sizes do |t|
      t.string :size
      t.integer :amount
      t.string :value
      t.integer :sequence
      t.string :thumb_image
      t.text :description

      t.timestamps
    end
  end
end
