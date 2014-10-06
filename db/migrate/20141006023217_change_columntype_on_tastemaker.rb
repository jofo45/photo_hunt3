class ChangeColumntypeOnTastemaker < ActiveRecord::Migration
  def change
  	change_column :tastemakers, :tastemaker_instagram_id, :string
  	change_column :tastemakers, :tastemaker_full_name, :string
  	change_column :tastemakers, :tastemaker_instagram_username, :string
  	change_column :tastemakers, :tastemaker_profile_pict, :string
  	change_column :tastemakers, :tastemaker_website, :string
  	change_column :tastemakers, :tastemaker_bio, :string
  	change_column :tastemakers, :tastemaker_full_name, :string
  	change_column :tastemakers, :tastemaker_full_name, :string
  	change_column :tastemakers, :tastemaker_full_name, :string
  	change_column :tastemakers, :tastemaker_full_name, :string
  end
end
