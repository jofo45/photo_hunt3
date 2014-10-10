class UrlsController < ApplicationController

def new
	@url = Url.new
end

def createurl
	@userkey = current_user.id
	@hash = rand(50000..1000000)
	@hash_code = (@hash.to_s + "UUUUU".to_s + @userkey.to_s)
	# safe_url_params = params.require(:url).permit(:link)

	@url = Url.new ({
          hash_code: @hash_code,
		  user_id: current_user.id
          })
	@url.save
end

def show
	@url = Url.find params[:id]
	@full_path = "#{request.protocol}#{request.host_with_port}/#{@url.hash_code}"
end

def redirector
	@url = Url.find_by hash_code: params[:code]
	if @url
	  redirect_to @url.forwarding_link
	else
	  redirect_to root_path
	end
end

def index
	create
end

def preview
		@url = Url.find_by hash_code: params[:code]
	unless @url
		  redirect_to root_path
	end
end




end
