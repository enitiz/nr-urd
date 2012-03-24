class RemoveStudentIdFromMembers < ActiveRecord::Migration
  def up
    remove_column :members, :student_id
        remove_column :members, :nstudent_id
      end

  def down
    add_column :members, :nstudent_id, :integer
    add_column :members, :student_id, :integer
  end
end
