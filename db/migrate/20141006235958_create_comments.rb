class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :instagram_created_time
      t.string :instagram_comment_id
      t.string :source
      t.string :text_field
      t.integer :comment_score,       		default: 50
      t.boolean :confirmed_comment,			default: false

      t.timestamps
    end
  end
end
