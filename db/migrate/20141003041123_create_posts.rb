class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :link
      t.string :post
      t.string :created_time
      t.integer :likes
      t.string :post_id
      t.string :photo_standard_res

      t.timestamps
    end
  end
end
