class AddMemberIdToStudents < ActiveRecord::Migration
  def change
    add_column :students, :member_id, :integer

  end
end
