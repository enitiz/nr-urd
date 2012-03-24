class AddMemberIdToNstudents < ActiveRecord::Migration
  def change
    add_column :nstudents, :member_id, :integer

  end
end
