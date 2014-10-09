class TastemakersController < ApplicationController

  def index
  	@tastemakers = Tastemaker.all 
  end

  def show
    @tastemaker = Tastemaker.find(params[:id])
    @posts = @tastemaker.posts

  	# @post = Post.find(params[:id])

    # @posts = Posts.find_by(post_id: @post.id)

  end

  def create
  end

  def new
  end
end

