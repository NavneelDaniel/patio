class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :menu_item_id
      t.string :menu_item_name
      t.integer :price
      t.string :user_id
      t.integer :quantity

      t.timestamps
    end
  end
end
