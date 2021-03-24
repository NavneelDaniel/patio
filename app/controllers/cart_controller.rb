class CartController < ApplicationController
  before_action :ensure_user_logged_in

  def create
    menu_item = MenuItem.find(params[:id])

    cart_item = Cart.create(menu_item_id: params[:id],
                            menu_item_name: menu_item.name,
                            price: menu_item.price,
                            user_id: current_user.id,
                            quantity: 1)
    # flash[:message] = "Item Added!"
    redirect_to "/menu"
  end

  def add
    cart_item = Cart.find_by(user_id: session[:current_user_id], menu_item_id: params[:id])
    cart_item.quantity += 1
    cart_item.save
    redirect_to "/menu"
  end

  def subtract
    cart_item = Cart.find_by(user_id: session[:current_user_id], menu_item_id: params[:id])
    if cart_item.quantity > 1
      cart_item.quantity -= 1
      cart_item.save
    else
      Cart.destroy(cart_item.id)
    end
    redirect_to "/menu"
  end

  def destroy
    id = params[:id]
    Cart.destroy(id)
    redirect_to "/menu"
  end

  def checkout
    cart_items = Cart.where(user_id: current_user.id)
    new_order_id = Order.last.id + 1
    order_total = Cart.calculate_total(current_user.id)

    for cart_item in cart_items
      OrderItem.create!(order_id: new_order_id,
                        menu_item_id: cart_item.menu_item_id,
                        menu_item_name: cart_item.menu_item_name,
                        price: cart_item.price,
                        quantity: cart_item.quantity,
                        user_id: cart_item.user_id)

      Cart.destroy(cart_item.id)
    end

    Order.create!(user_id: cart_item.user_id,
                  total_sale: order_total,
                  delivery_status: "Dispatched")
    redirect_to "/orders/#{session[:current_user_id]}"
  end
end
