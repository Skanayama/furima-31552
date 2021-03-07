class BuyLogsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @item = Item.find(params[:item_id])  
    @buy_log_address = BuyLogAddress.new
      if current_user == @item.user
        redirect_to items_path
      elsif @item.buy_log.present?
        redirect_to items_path
      end
  end
 
  def create
    @buy_log_address = BuyLogAddress.new(buy_log_params)   
    @item = Item.find(params[:item_id])  
     if @buy_log_address.valid?
       Payjp.api_key =  ENV["PAYJP_SECRET_KEY"] 
       Payjp::Charge.create(
         amount: @item.price,  
         card: buy_log_params[:token],   
         currency: 'jpy'                
       )
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

end