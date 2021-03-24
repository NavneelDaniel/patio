class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def create
    User.create!(name: params[:name],
                 email: params[:email],
                 password_digest: params[:password],
                 role: "Customer")

    flash[:message] = "Account created."
    redirect_to "/signin"
  end

  def update
    if current_user && current_user.email == params[:email]
      user = User.find_by(@current_user.id)
      user.email = params[:email]
      user.password = params[:password]

      user.save
      render plain: "Updated user email."
    else
      render plain: "You are not authorized to do that."
    end
  end

  def new
    render "users/new"
  end
end
