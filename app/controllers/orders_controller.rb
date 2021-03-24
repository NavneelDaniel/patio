class OrdersController < ApplicationController
  before_action :ensure_user_logged_in

  def display_all
    if @current_user.role != "admin"
      current_user_id = @current_user.id
      @user_orders = Order.where(user_id: current_user_id)
    else
      @user_orders = Order.get_all_orders
    end

    render "order"
  end
end
