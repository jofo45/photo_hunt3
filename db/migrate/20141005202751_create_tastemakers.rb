class CreateTastemakers < ActiveRecord::Migration
  def change
    create_table :tastemakers do |t|
      t.string :tastemaker_instagram_id
      t.string :tastemaker_instagram_full_name
	  t.integer :tastemaker_instagram_id
	  t.integer :tastemaker_full_name
	  t.integer :tastemaker_instagram_username
	  t.integer :tastemaker_profile_pict
	  t.integer :tastemaker_counts_posts 
	  t.integer :tastemaker_counts_follows 
	  t.integer :tastemaker_counts_followed_by
	  t.integer :tastemaker_website
	  t.integer :tastemaker_bio
	  t.integer :tastemaker_influence_score
	  t.boolean :elite_tastemaker, default: false
	  t.boolean :fashion_tastemaker, default: false

      t.timestamps
    end
  end
end
