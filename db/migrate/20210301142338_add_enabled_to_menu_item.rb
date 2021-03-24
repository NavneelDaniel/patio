class AddEnabledToMenuItem < ActiveRecord::Migration[6.1]
  def change
    add_column :menu_items, :enabled, :boolean
    MenuItem.update_all(enabled: true)
  end
end
