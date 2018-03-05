class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories, id: :uuid do |t|
      t.string :title
      t.timestamps
    end
  end
end
