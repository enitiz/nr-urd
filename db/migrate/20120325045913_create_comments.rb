class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :points
      t.integer :member_id
      t.integer :post_id

      t.timestamps
    end
  end
end
