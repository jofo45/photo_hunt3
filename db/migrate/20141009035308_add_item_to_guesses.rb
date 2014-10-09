class AddItemToGuesses < ActiveRecord::Migration
  def change
    add_reference :guesses, :item, index: true
  end
end
