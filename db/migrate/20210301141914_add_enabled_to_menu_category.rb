class AddEnabledToMenuCategory < ActiveRecord::Migration[6.1]
  def change
    add_column :menu_categories, :enabled, :boolean
    MenuCategory.update_all(enabled: true)
  end
end
