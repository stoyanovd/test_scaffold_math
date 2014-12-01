class CreateResultColors < ActiveRecord::Migration
  def change
    create_table :result_colors do |t|
      t.string :word
      t.integer :color

      t.timestamps
    end
  end
end
