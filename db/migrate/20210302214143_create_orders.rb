class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :user_id
      t.integer :total_sale
      t.string :delivery_status

      t.timestamps
    end
  end
end
