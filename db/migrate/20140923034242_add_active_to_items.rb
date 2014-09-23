class AddActiveToItems < ActiveRecord::Migration
  def change
    add_column :items, :currently_active, :boolean, default:true
  end
end
