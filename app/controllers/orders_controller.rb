class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.save
      redirect_to root_path
    end
  end

  private
  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture, :city, :house_number, :builiding_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  
end
