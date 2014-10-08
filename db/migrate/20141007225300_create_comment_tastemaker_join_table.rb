class CreateCommentTastemakerJoinTable < ActiveRecord::Migration
  def change
    create_join_table :comments, :tastemakers do |t|

      t.belongs_to :comment
      t.belongs_to :tastemaker
      
      t.index [:comment_id, :tastemaker_id]
      t.index [:tastemaker_id, :comment_id]
    end
  end
end
