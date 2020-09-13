class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @order = OrderShipment.new
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id
    redirect_to root_path if @item.order
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderShipment.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_shipment).permit(:postal, :prefecture_id, :city, :house_number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end
end
