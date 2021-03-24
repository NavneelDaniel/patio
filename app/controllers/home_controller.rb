class HomeController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def welcome
    if current_user
      redirect_to "/menu"
    else
      render "home"
    end
  end
end
