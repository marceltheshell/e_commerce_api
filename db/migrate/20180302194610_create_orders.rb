class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders, id: :uuid do |t|
      t.integer :status, default: 0
      t.belongs_to :customer, type: :uuid, index: true
      t.timestamps
    end
  end
end


