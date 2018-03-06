class OrdersProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :orders_products, id: false do |t|
      t.belongs_to :order, type: :uuid, index: true
      t.belongs_to :product, type: :uuid, index: true
      t.timestamps
    end
  end
end
