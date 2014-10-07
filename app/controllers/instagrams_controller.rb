class InstagramsController < ApplicationController

#Instagram.methods       add binding.pry below in the action below and then enter the Instagram.method in the pry controller.

  def index
    # authorize! :read, @user
    get_instagrams
    @posts = Post.all 
  end

  def show
    # authorize! :read, @user
    get_instagrams
    @posts = Post.all 
  end


  def get_instagrams
    User.all.each do |user|
      if user.identities.find_by_provider('instagram').nil?
        next
      end

    # user = User.find_by_id(current_user)
    instagram_token = user.identities.find_by_provider('instagram').social_token
    instagram_user_id = user.identities.find_by_provider('instagram').uid

    Instagram.configure do |config|
      config.client_id = ENV['instagram_client_id']
      config.access_token = instagram_token
    end

    Instagram.user_media_feed.each do |individ_post|
      #also try to pull "liked media by the user"  Instagram.user_liked_media

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
      else
      end

      if Post.find_by(instagram_post_id: individ_post.id).nil?
        @tastemaker = Tastemaker.find_by(tastemaker_instagram_id: individ_post.user.id)
        # @tastemaker.posts.build
        # @tastemaker.posts.create
        @post = @tastemaker.posts.new({
        link: individ_post.link, 
        post_type: individ_post.type, 
        instagram_post_created_time: individ_post.created_time, 
        likes: individ_post.likes.first.last, # the following code did not work, b/c count is method. individ_post.likes.count, 
        instagram_post_id: individ_post.id, 
        photo_standard_res: individ_post.images.standard_resolution.url,
        photo_low_res: individ_post.images.low_resolution.url,
        photo_thumbnail_res: individ_post.images.thumbnail.url,
        })
        @post.save


        individ_post.comments.data.each do |individ_comment|
          @comment = @post.comments.create({
          instagram_created_time: individ_comment.created_time,
          source: "Instagram",
          text_field: individ_comment.text
          # comment_score:
          # confirmed_comment:
          })
        end


        individ_post.tags.each do |individ_tag|
          @tag = @post.tags.create({
            tag_name: individ_tag
            })
          #increase tag popularity if it comes from popular post
          # why isn't this working??

          # if @post[:likes] > 1000 || @post.tastemaker.tastemaker_influence_score >50
          #   @tag[:popularity] *= 1.05
          # end
          @tag[:popularity] *= 1.05 if @post.likes > 1000
        end

      else
        @post = Post.find_by(instagram_post_id: individ_post.id)
        @post.update(likes: individ_post.likes.first.last)
        # binding.pry
      end
     end
  end
  end

end






  #   Instagram.user_media_feed.each do |individ_post|
  #     if Post.find_by(instagram_post_id: individ_post.id).nil?
  #       Post.create!({
  #       link: individ_post.link, 
  #       post_type: individ_post.type, 
  #       instagram_post_created_time: individ_post.created_time, 
  #       likes: individ_post.likes.first.last, # the following code did not work, b/c count is method. individ_post.likes.count, 
  #       instagram_post_id: individ_post.id, 
  #       photo_standard_res: individ_post.images.standard_resolution.url,
  #       photo_low_res: individ_post.images.low_resolution.url,
  #       photo_thumbnail_res: individ_post.images.thumbnail.url,

  #       tastemaker_instagram_id:  individ_post.user.id,
  #       tastemaker_full_name: individ_post.user.full_name,
  #       tastemaker_username: individ_post.user.username,
  #       tastemaker_profile_pic: individ_post.user.profile_picture

  #       #the below information must be added separately, perhaps by looking up the instagram ID and pulling the info.  B/c if you pull the "user" data, it pulls the data of the person loged in not the poster.
  #       # tastemaker_counts_posts: Instagram.user.counts.media
  #       # tastemaker_counts_follows: Instagram.user.counts.follows
  #       # tastemaker_counts_followed_by: Instagram.user.counts.followed_by
  #       # tastemaker_website: Instagram.user.website
  #       # tastemaker_influence_score: 

  #       })
  #     else
  #       post = Post.find_by(instagram_post_id: individ_post.id)
  #       post.update(likes: individ_post.likes.first.last)
  #     end
  #   end
  #   end
  # end







      # Tastemaker.findby 

      # tastemaker_id:  Instagram.user_media_feed.first.user.id
      # tastemaker_full_name: Instagram.user_media_feed.first.user.full_name
      # tastemaker_username = Instagram.user_media_feed.first.user.username
      # tastemaker_profile_pic = Instagram.user_media_feed.first.user.profile_picture



    # Tags.create(content:tags.content)

    # @instagram_response= {:photos=> photos }

    # photos = Instagram.user_recent_media(instagram_user_id.to_s)
    # photos = Instagram.photos
    # user_Data = Instagram.user_data

    # tags = Instagram.post_tags 


# Changes the response if/when it is called by javascript vice html.
    # respond_to do |format|
    #   format.html
      # format.json {render json: @photos}
    # end

  # end






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




