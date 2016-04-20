class OrdersController < ApplicationController
  before_action :require_user

  def index
    @user = current_user
    @orders = @user.orders

  end

private


end
