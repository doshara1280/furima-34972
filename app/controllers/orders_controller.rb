class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  def index
    @orders = Order.new
    @item = Item.find(params[:item_id])
    @purchase_history_order = PurchaseHistoryOrder.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.new
    @purchase_history_order = PurchaseHistoryOrder.new(purchase_history_order_params)
    if @purchase_history_order.valid?
      pay_item
      @purchase_history_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_history_order_params
    params.require(:purchase_history_order).permit(:postal_code, :shipping_area_id, :municipality, :address, :building_name, :tel).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    binding.pry
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_history_order_params[:token],
      currency: 'jpy'
    )
  end
end