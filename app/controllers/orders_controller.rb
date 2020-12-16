class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, :set_order, only: [:index, :create]

  def index
    if user_signed_in? && current_user.id != @item.user_id
      @user_order = UserOrder.new
    elsif user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def create
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      pay_item
      @user_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_order
    if @item.order != nil
      redirect_to root_path
    end
  end

  def order_params
    params.require(:user_order).permit(
      :user_id, :item_id, :postal_code, :prefectures_id, :municipality,
      :address, :building_name, :phone_number
    ).merge(user_id: current_user.id, item_id: @item, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
