class CreateNstudents < ActiveRecord::Migration
  def change
    create_table :nstudents do |t|
      t.string :title
      t.string :designation
      t.string :qualification

      t.timestamps
    end
  end
end
