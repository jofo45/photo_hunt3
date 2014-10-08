class AddPostToGuesses < ActiveRecord::Migration
  def change
    add_reference :guesses, :post, index: true
  end
end
