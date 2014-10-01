class InstagramsController < ApplicationController



def user_instagram_feed 
	#the_data = HTTParty.get(“https://api.instagram.com/v1/tags/#{hashtag}/media/recent?client_id=#{INSTAGRAM_CLIENT_ID}”)
 
	user_instagram_feed = HTTParty.get(https://api.instagram.com/v1/users/self/feed?access_token=#{auth.uid})

	return user_instagram_feed[“data”]
end

def show 
	#the_data = HTTParty.get(“https://api.instagram.com/v1/tags/#{hashtag}/media/recent?client_id=#{INSTAGRAM_CLIENT_ID}”)
 
	user_instagram_feed = HTTParty.get(https://api.instagram.com/v1/users/self/feed?access_token=#{auth.uid})

	return user_instagram_feed[“data”]
end




# # require 'json'
# # require 'rest-client'

# def instagram_user_info
#   instagram_api_response = JSON.load(RestClient.get('https://api.instagram.com/v1/users/1574083/?access_token=ACCESS-TOKEN'))
  
# 	# puts reddit_api_response['data']['children']

# 	binding.pry
# 	instagram_api_response['data']['children'].map do |entry|
#   	story = "Title:  #{entry['data']['title']}"
#   	story

#     "id": "1574083",
#     "username": "snoopdogg",
#     "full_name": "Snoop Dogg",
#      "profile_picture": "http://distillery.s3.amazonaws.com/profiles/profile_1574083_75sq_1295469061.jpg",
#      "bio": "This is my bio",
#      user.website = "website": "http://snoopdogg.com",
     # "counts_media": counts.media

     #        "media": 1320,
     #        "follows": 420,
     #        "followed_by": 3410
 


  # response["data"]["children"].map do |entry|
  #   story = {title: story["data"]["title"], category: story["data"]["subreddit"]}

  #   calculate_upvotes story
  #   show_new_story_notification story

  #   story
# end






end
