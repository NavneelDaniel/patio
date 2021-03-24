class Cart < ApplicationRecord
  validates :menu_item_id, :menu_item_name, :price, :user_id, presence: true

  def self.item_present(menu_item_id, current_user_id)
    items = Cart.where(user_id: current_user_id, menu_item_id: menu_item_id)
    if items != []
      return true
    else
      return false
    end
  end

  def self.get_cart_item(current_user_id, user_id)
    Cart.all.find_by(user_id: current_user_id, menu_item_id: user_id)
  end

  def self.calculate_total(current_user_id)
    cart_items = Cart.where(user_id: current_user_id)
    total = 0
    for item in cart_items
      total += (item.price * item.quantity)
    end
    return total
  end
end
