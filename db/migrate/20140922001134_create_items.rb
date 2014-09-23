class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :classification
      t.string :description
      t.string :brand
      t.string :url_link
      t.string :product_id
      t.string :image
      t.integer :price_web

      t.timestamps
    end
  end
end
