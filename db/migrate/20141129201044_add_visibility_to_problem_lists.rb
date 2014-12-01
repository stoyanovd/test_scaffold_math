class AddVisibilityToProblemLists < ActiveRecord::Migration
  def change
    add_column :problem_lists, :visibility, :boolean
  end
end
