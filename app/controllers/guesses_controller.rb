class GuessesController < ApplicationController
  def index
  end

  def create
    if user_signed_in?
      @comment = current_user.comments.create guess_params
      redirect_to @guess.post
      redirect_to instagrams_path
    else
      redirect_to new_user_session_path, alert: "Only logged in users can create comments"
    end
  end

  def new
  end

  def update
  end

  private 
  def guess_params
    params.require(:item).merge(post_id: params[:post_id])
  end
end

