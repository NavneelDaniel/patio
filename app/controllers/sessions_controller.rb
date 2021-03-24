class SessionsController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
  end

  def create
    # checks if user exists and log them in.
    user = User.find_by(email: params[:email])
    if user && user.password_digest == params[:password]
      session[:current_user_id] = user.id

      if user.role == "Owner"
        redirect_to "/admin"
      else
        redirect_to "/menu"
      end
    else
      flash[:error] = "Your login attempt was invalid. Please retry."
      redirect_to "/signin"
    end
  end

  def destroy
    session[:current_user_id] = nil
    # flash[:message] = "You were logged out. Thanks for visiting our page!"
    @current_user = nil
    redirect_to "/"
  end
end
