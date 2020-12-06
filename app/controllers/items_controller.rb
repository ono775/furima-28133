class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    if item.save
      redirect_to item_path(item.id)
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(
      :image, :name, :description, :category_id, :status_id,
      :shipping_charge_id, :shipping_area_id, :shipping_date_id, :price
    ).merge(user_id: current_user.id)
  end
end
