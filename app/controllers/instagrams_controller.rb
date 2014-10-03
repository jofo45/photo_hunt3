class InstagramsController < ApplicationController

#Instagram.methods       add binding.pry below in the action below and then enter the Instagram.method in the pry controller.




  def get_instagrams
    User.all.each do |user|
      if user.identities.find_by_provider('instagram').nil?
        next
      end

    # user = User.find_by_id(current_user)
    instagram_token = user.identities.find_by_provider('instagram').social_token
    instagram_user_id = user.identities.find_by_provider('instagram').uid

    # binding.pry
    Instagram.configure do |config|
      config.client_id = ENV['instagram_client_id']
      config.access_token = instagram_token
    end

    photos = Instagram.user_recent_media(instagram_user_id.to_s)
    photos = Instagram.photos
    user_Data = Instagram.user_data

    tags = Instagram.post_tags 

    Instagram.user_media_feed.each do |individ_post|

      Post.create!({
      link: individ_post.link, 
      post: individ_post.type, 
      created_time: individ_post.created_time, 
      likes: individ_post.likes.count, 
      post_id: individ_post.id, 
      photo_standard_res: individ_post.images.standard_resolution.url
      })

    end





      # Tastemaker.findby 

      # tastemaker_id:  Instagram.user_media_feed.first.user.id
      # tastemaker_full_name: Instagram.user_media_feed.first.user.full_name
      # tastemaker_username = Instagram.user_media_feed.first.user.username
      # tastemaker_profile_pic = Instagram.user_media_feed.first.user.profile_picture



    # Tags.create(content:tags.content)

    # @instagram_response= {:photos=> photos }



# Changes the response if/when it is called by javascript vice html.
    # respond_to do |format|
    #   format.html
      # format.json {render json: @photos}
    # end

  end

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




