class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers, id: :uuid do |t|
      t.string :email
      t.timestamps
    end
  end
end
