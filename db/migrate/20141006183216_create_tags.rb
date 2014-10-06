class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :tag_name
      t.string :provider
      t.integer :popularity
      t.integer :fashion_score
      t.boolean :elite_tag

      t.timestamps
    end
  end
end
