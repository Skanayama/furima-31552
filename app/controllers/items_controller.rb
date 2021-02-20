class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @items = Item.all.order(id: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end
  
  def edit
    @item = Item.find(params[:id])
    unless current_user == @item.user
      redirect_to action: :index
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :state_id, :deliver_fee_id, :deliver_area_id, :deliver_date_id, :price).merge(user_id: current_user.id)
  end


end
