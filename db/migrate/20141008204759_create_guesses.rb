class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.integer :guess_score,       		default: 50
      t.boolean :confirmed_guess,			default: false
      t.integer :item

      t.timestamps
    end
  end
end
