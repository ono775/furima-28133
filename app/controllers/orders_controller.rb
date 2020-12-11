class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    if user_signed_in? && current_user.id != @item.user_id
      @user_order = UserOrder.new
    elsif user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def create
  end
end
