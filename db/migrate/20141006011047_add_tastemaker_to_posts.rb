class AddTastemakerToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :tastemaker, index: true
  end
end
