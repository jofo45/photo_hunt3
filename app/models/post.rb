class Post < ActiveRecord::Base
	belongs_to :tastemaker
	has_and_belongs_to_many :tags
	has_many :comments
	has_and_belongs_to_many :items
	has_many :guesses


  def self.popular
    where :likes >= 50 || :comment_count >= 50
  end

  def self.recent
    where 'created_at >= ?', Date.today
  end

  def self.search_for(query)
    where('#{self.tags} LIKE :query OR description LIKE :query', query: "%#{query}%")
  end
end
