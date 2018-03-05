class CategoriesProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :categories_products, id: false do |t|
      t.belongs_to :category, type: :uuid, index: true
      t.belongs_to :product, type: :uuid, index: true
    end
  end
end
