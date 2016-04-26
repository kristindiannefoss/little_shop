class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cart

  helper_method :current_user, :set_redirect, :current_admin?
  # skip_before_filter :verify_authenticity_token, only: [:index]
  

  def set_redirect
    if request.referrer == "/login"
      session[:redirect] = dashboard_path
    else
      session[:redirect] = request.referrer || dashboard_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def set_cart
    @cart ||= Cart.new(session[:cart])
  end

  def require_user
    render file: "/public/404" unless current_user
  end

  def current_admin?
    current_user && current_user.admin?
  end
end
