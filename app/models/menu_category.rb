class MenuCategory < ApplicationRecord
  has_many :menu_items

  def self.getCategory_Ids
    MenuCategory.ids
  end

  def self.getCategory(category_id)
    return MenuCategory.find(category_id)
  end

  def self.enabled?(category_id)
    category = MenuCategory.find(category_id)
    category.enabled
  end
end
