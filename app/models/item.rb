# == Schema Information
#
# Table name: items
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  classification   :string(255)
#  description      :string(255)
#  brand            :string(255)
#  url_link         :string(255)
#  product_id       :string(255)
#  image            :string(255)
#  price_web        :integer
#  created_at       :datetime
#  updated_at       :datetime
#  currently_active :boolean          default(TRUE)
#

class Item < ActiveRecord::Base
	has_and_belongs_to_many :posts

end
