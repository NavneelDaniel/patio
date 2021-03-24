class CreateMenuCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_categories do |t|
      t.string :category_name
      t.string :string
      t.timestamps
    end
  end
end
