class Guess < ActiveRecord::Base
  # attr_accessible :items_attributes

  belongs_to :user
  belongs_to :post
  belongs_to :item
  accepts_nested_attributes_for :items, :reject_if => :all_blank, :allow_destroy => true

end
