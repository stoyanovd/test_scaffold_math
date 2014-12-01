class RemoveColorFromResultColors < ActiveRecord::Migration
  def change
    remove_column :result_colors, :color
  end
end
