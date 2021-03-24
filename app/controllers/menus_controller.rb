class MenusController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    render "menu/index"
  end

  def show
    id = params[:id]
    item = MenuCategory.find(id)
    render plain: "This is menu item: #{item.category_name}"
  end
end
