class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :link
      t.string :post_type
      t.string :post_description
      t.string :instagram_post_created_time
      t.integer :likes
      t.integer :comment_count
      t.string :instagram_post_id
      t.string :photo_standard_res
      t.string :photo_low_res
      t.string :photo_thumbnail_res

      t.timestamps
    end
  end
end





