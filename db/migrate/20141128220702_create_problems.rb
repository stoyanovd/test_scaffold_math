class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.integer :number
      t.text :body
      t.integer :problem_list_id

      t.timestamps
    end
  end
end
