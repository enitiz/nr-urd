class AddVotesToMembers < ActiveRecord::Migration
  def change
		add_column :members, :up_votes, :integer, :null => false, :default => 0
		add_column :members, :down_votes, :integer, :null => false, :default => 0

  end
end
