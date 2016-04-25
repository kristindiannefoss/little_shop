class OrdersController < ApplicationController
  before_action :require_user

  def index
    @user = current_user
    @orders = @user.orders
  end

  def show
    @order = current_user.orders.find_by(id: params[:order_id])
    @order_items = OrderItem.where(order_id: @order.id) if @order
    redirect_to '/errors/not_found.html' unless @order
  end

  def create
    @order = current_user.orders.new
    if @order.save
      @cart.contents.each_pair do |item_id, item_qnt|
        @order.order_items.create(item_id: item_id.to_i, quantity: item_qnt)
        @order.update(status: "ordered")
      end
      session.delete :cart
      flash[:notice] = "Order was successfully placed"
      redirect_to orders_path
    else
      flash.now[:error] = "Please log in to place an order"
      redirect_to login_path
    end
  end

  private

  def order_params
    params.require(:order).permit(:user_id)
  end
end
