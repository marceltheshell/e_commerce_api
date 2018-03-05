class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products, id: :uuid do |t|
      t.string :name
      t.decimal :price
      t.belongs_to :order, type: :uuid, index: true
      t.timestamps
    end
  end
end
