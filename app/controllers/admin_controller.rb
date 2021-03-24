class AdminController < ApplicationController
  before_action :check_authorization_owner

  def index
  end

  def update_category
    id = params[:id]
    category = MenuCategory.find_by(id: id)

    category.enabled = (not category.enabled)
    category.save
    redirect_to "/admin"
  end

  def destroy_category
    id = params[:id]

    MenuCategory.destroy(id)
    redirect_to "/admin"
  end

  def update_item
    id = params[:id]
    item = MenuItem.find_by(id: id)

    item.enabled = (not item.enabled)
    item.save
    redirect_to "/admin"
  end

  def destroy_item
    id = params[:id]

    MenuItem.destroy(id)
    redirect_to "/admin"
  end

  def get_view_create_menu_item
    category_id = params[:id]
    @category = MenuCategory.getCategory(category_id)
    render "new-menu-item"
  end

  def create_menu_item
    MenuItem.create!(menu_categry_id: params[:menu_categry_id],
                     name: params[:name],
                     description: params[:description],
                     price: params[:price],
                     enabled: true)

    flash[:message] = "Menu item created."
    redirect_to "/admin"
  end

  def get_view_create_menu_category
    render "new-menu-category"
  end

  def create_menu_category
    MenuCategory.create!(category_name: params[:category_name])

    flash[:message] = "Menu category created."
    redirect_to "/admin"
  end
end
