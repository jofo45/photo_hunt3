class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :link
      t.string :hash_code
      t.string :forwarding_link

      t.timestamps
    end
  end
end
