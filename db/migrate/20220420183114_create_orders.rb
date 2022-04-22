class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.date :date
      t.references :cashier
      t.string :name
      t.float :amount

      t.timestamps
    end
  end
end
