class AddTokentoIdentities < ActiveRecord::Migration
  def change
 	add_column :identities,  :social_token, :string
  end
end
