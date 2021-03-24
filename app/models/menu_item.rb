class MenuItem < ApplicationRecord
  belongs_to :menu_category, optional: true

  def self.getCategory_Items(category_id)
    MenuItem.where(menu_categry_id: category_id)
  end

  def self.enabled?(item_id)
    category = MenuItem.find(item_id)
    category.enabled
  end
end
