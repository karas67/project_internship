class CreateCashiers < ActiveRecord::Migration[6.1]
  def change
    create_table :cashiers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, null: false, default: ""
      t.string :password

      t.timestamps
    end
  end
end
