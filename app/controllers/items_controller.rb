class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]
  def index
    @item = Item.all.order(id: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
       redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
       redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def set_item
    @item = Item.includes(:user).find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image, :condition_id, :category_id, :fee_id, :place_id, :day_id).merge(user_id: current_user.id)
  end
end
