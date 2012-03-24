class AddDesignatedToNstudent < ActiveRecord::Migration
  def change
    add_column :nstudents, :designated_to, :string

  end
end
