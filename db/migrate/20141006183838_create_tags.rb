class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :tag_name
      t.string :provider
      t.integer :popularity,          default: 50
      t.integer :fashion_score,       default: 50
      t.boolean :elite_tag,           default: false

      t.timestamps
    end
  end
end
