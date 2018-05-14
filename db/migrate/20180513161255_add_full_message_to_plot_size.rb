class AddFullMessageToPlotSize < ActiveRecord::Migration[5.2]
  def change
    add_column :plot_sizes, :full_message, :text
  end
end
