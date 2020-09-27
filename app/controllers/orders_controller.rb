class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new(order_params)
  end

  def create
    binding.pry
  end

  private
  def order_params
    params.permit(:item_id, :postal_code, :prefecture, :city, :house_number, :builiding_name, :phone_number).merge(user_id: current_user.id)
  end
end
