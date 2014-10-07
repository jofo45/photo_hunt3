class Post < ActiveRecord::Base
	belongs_to :tastemaker
	has_and_belongs_to_many :tags
	has_many :comments
end
