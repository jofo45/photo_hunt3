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
    @tastemaker = Tastemaker.new
  end

  def create
    @tastemaker = Tastemaker.new(tastemaker_params)
    if @tastemaker.save
      redirect_to @tastemaker, notice: "Fashionista was created!"
    else
      render 'new'
    end
  end

  def edit
    @tastemaker = Tastemaker.find(params[:id])
  end

  def update
    #why do i need to add this @tastemaker = Tastemaker.find(params[:id]).  Doesn't the @ make this a global varieble.
    @tastemaker = Tastemaker.find(params[:id])
    if @tastemaker.update!(tastemaker_params)
      redirect_to @tastemaker, notice: "Fashionista was updated!  You are awesome!"
    else
      render 'edit'
    end
  end


  private

  def set_tastemaker
    @tastemaker = Tastemaker.find(params[:id])
  end

  def tastemaker_params
    params.require(:tastemaker).permit(:tastemaker_influence_score, :fashion_tastemaker, :elite_tastemaker)
  end


end

