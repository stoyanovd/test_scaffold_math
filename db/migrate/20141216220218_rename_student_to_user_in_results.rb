class RenameStudentToUserInResults < ActiveRecord::Migration
  def change
    rename_column :results, :student_id, :user_id
  end
end
