class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_cart

  def set_cart
    @cart ||= Cart.new(session[:cart])
  end
end
