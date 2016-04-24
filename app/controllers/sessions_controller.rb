class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in as #{user.first_name}"

      if current_admin?
        redirect_to admin_dashboard_path
      else
        redirect_to cart_path
      end
      
    else
      flash.now[:error] = "Invalid Credentials"
      render :new
    end
  end

  def destroy
    session.delete :user_id
    redirect_to items_path
  end

end
