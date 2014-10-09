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
  end



  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :classification, :brand, :url_link, :product_id, :image, :price_web)
  end

end
