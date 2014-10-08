class ImportInstagramUserFeed
	def call
		User.all.each do |user|
			initialize_instagram(user)

			Instagram.user_media_feed.each do |individ_post|
				#also try to pull "liked media by the user"  Instagram.user_liked_media

				create_tastemaker(individ_post)
		end
	end

	private

	def initialize_instagram(user)
      # user = User.find_by_id(current_user)
      instagram_token = user.identities.find_by_provider('instagram').social_token
      instagram_user_id = user.identities.find_by_provider('instagram').uid

      Instagram.configure do |config|
        config.client_id = ENV['instagram_client_id']
        config.access_token = instagram_token
      end
  end

  def create_tastemaker(individ_post)
	if Tastemaker.find_by(tastemaker_instagram_id: individ_post.user.id).nil?
		Tastemaker.create!({
		  tastemaker_instagram_id:  individ_post.user.id,
		  tastemaker_full_name: individ_post.user.full_name,
		  tastemaker_instagram_username: individ_post.user.username,
		  tastemaker_profile_pict: individ_post.user.profile_picture 
		  })
		  #the below information must be added separately, perhaps by looking up the instagram ID and pulling the info.  B/c if you pull the "user" data, it pulls the data of the person loged in not the poster.
		  # tastemaker_counts_posts: Instagram.user.counts.media
		  # tastemaker_counts_follows: Instagram.user.counts.follows
		  # tastemaker_counts_followed_by: Instagram.user.counts.followed_by
		  # tastemaker_website: Instagram.user.website
		  # tastemaker_influence_score: 
		end	
	end
end