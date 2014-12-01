class AddThreeColorsToResultColors < ActiveRecord::Migration
  def change
    add_column :result_colors, :red, :integer
    add_column :result_colors, :green, :integer
    add_column :result_colors, :blue, :integer
  end
end
