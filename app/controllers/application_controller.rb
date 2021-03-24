class ApplicationController < ActionController::Base
  before_action :ensure_user_logged_in

  def ensure_user_logged_in
    unless current_user
      # halt that request cycle
      redirect_to "/"
    end
  end

  def check_authorization_owner
    unless current_user && current_user.role == "Owner"
      flash[:error] = "Invalid authorization.Please contact owner"
      redirect_to "/"
    end
  end

  def current_user
    # memoization
    return @current_user if @current_user

    current_user_id = session[:current_user_id]

    if current_user_id
      @current_user = User.find(current_user_id)
    end
  end
end
