class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :no_current_user_redirect, only: [:edit, :update, :destroy]
  
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
  end
  
  def edit
    buy_check
  end
  
  def update
    buy_check
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to action: :index
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :state_id, :deliver_fee_id, :deliver_area_id, :deliver_date_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def no_current_user_redirect
    unless current_user == @item.user
      redirect_to action: :index
    end
  end

  def buy_check
    if @item.buy_log.present?
      redirect_to items_path
    end
  end

end
