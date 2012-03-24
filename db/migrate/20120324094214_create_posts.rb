class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :points
      t.integer :member_id

      t.timestamps
    end
  end
end
