class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cart


  helper_method :current_user, :set_redirect

  def set_redirect
    session[:redirect] =  request.referrer
    if session[:redirect].nil?
      session[:redirect] = dashboard_path
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

end
