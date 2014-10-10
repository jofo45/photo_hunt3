class AddItemToUrls < ActiveRecord::Migration
  def change
    add_reference :urls, :item, index: true
  end
end
