class ItemsController < ApplicationController
  # before_action :set_item, only: [:new, :edit, :show, :update]
  # before_filter :user_signed_in?

  def index
    # @items = Item.search_for(params[:q])
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to @item, notice: "Fashion Item was created!"
    else
      render 'new'
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    #why do i need to add this @item = Item.find(params[:id]).  Doesn't the @ make this a global varieble.
    @item = Item.find(params[:id])
    if @item.update item_params
      redirect_to @item, notice: "Fashion Item was updated!"
    else
      render 'edit'
    end
  end

  def show
    @item = Item.find(params[:id])

    if @item.urls.count > 0
       @personalized_item_link = @item.urls.first

      else
          @userkey = current_user.id
          @hash = rand(50000..1000000)
          @hash_code = (@hash.to_s + "UUUUU".to_s + @userkey.to_s)
          @fulllink = ("http://localhost:3000/".to_s + @hash_code.to_s)
          # safe_url_params = params.require(:url).permit(:link)

          @personalized_item_link = @item.urls.create!({
              hash_code: @hash_code,
              user_id: current_user.id,
              link: @fulllink
              })
          # @url.save
        current_user.urls << @personalized_item_link
        @personalized_item_link.update({forwarding_link: @item.url_link})
      end
  end



  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :classification, :brand, :url_link, :product_id, :image, :price_web)
  end

end
