class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.integer :rollnum
      t.string :positions

      t.timestamps
    end
  end
end
