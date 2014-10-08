class AddUserToGuesses < ActiveRecord::Migration
  def change
    add_reference :guesses, :user, index: true
  end
end
