class AddTastemakerToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :tastemaker, index: true
  end
end
