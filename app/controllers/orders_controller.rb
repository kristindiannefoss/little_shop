class OrdersController < ApplicationController
  before_action :require_user

  def index
    @user = current_user
    @orders = @user.orders
  end

  def show
    @order = Order.find(params[:id])
  end
end
