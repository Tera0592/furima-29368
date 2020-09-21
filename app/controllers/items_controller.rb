class ItemsController < ApplicationController
  def index
    @item = Item.all.order(id: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image, :condition_id, :category_id, :fee_id, :place_id, :day_id).merge(user_id: current_user.id)
  end
end
