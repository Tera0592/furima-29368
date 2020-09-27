class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture, :city, :house_number, :builiding_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  def pay_item
    Payjp.api_key = "sk_test_5dd3e963a14601d79dc3f2c4"
    Payjp::Charge.create(
     amount: @item.price,
     card: order_params[:token],
     currency:'jpy'
   )
  end
  
end
