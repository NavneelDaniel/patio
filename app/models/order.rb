class Order < ApplicationRecord
  has_many :OrderItem

  def get_order_items
    OrderItem.where(order_id: id)
  end

  def self.get_all_orders
    Order.all.to_a
  end
end
