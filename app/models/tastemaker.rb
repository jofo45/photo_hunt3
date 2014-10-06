class Tastemaker < ActiveRecord::Base
	has_many :posts

  # validates :title, :link, :category, :upvotes, presence: true

  # def self.popular
  #   where (tastemaker_counts_followed_by >= 100 || tastemaker_influence_score >= 5 || elite_tastemaker = true)
  # end

  # def self.recent
  #   where 'created_at >= ?', Date.today
  # end

  # def self.search_for(query)
  #   where('title LIKE :query OR category LIKE :query', query: "%#{query}%")
  # end

end
