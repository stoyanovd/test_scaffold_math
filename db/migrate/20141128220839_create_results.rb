class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :status
      t.integer :student_id
      t.integer :problem_id

      t.timestamps
    end
  end
end
