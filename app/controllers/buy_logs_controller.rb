class BuyLogsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]


  def index
    @buy_log_address = BuyLogAddress.new
    user_check
  end
 
  def create
    @buy_log_address = BuyLogAddress.new(buy_log_params)   
    user_check
     if @buy_log_address.valid?
       payjp
       @buy_log_address.save
       redirect_to items_path
     else
       render action: :index
     end
  end
 
  private
  def buy_log_params
   params.require(:buy_log_address).permit(:postal_code, :deliver_area_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])  
  end

  def user_check
    redirect_to items_path if current_user == @item.user || @item.buy_log.present?
  end

  def payjp
    Payjp.api_key =  ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item.price,  
      card: buy_log_params[:token],   
      currency: 'jpy'                
    )
  end

end