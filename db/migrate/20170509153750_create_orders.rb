class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :product_id
      t.float :total
    end
    add_index :orders, :product_id
  end
end
