class AddFildsForCashiers < ActiveRecord::Migration[6.1]
  def change
    add_column :cashiers, :encrypted_password, :string, null: false, default: ""
    add_column :cashiers, :reset_password_token, :string
    add_column :cashiers, :reset_password_sent_at, :datetime
    add_column :cashiers, :remember_created_at, :datetime
    add_column :cashiers, :confirmation_token, :string
    add_column :cashiers, :confirmed_at, :datetime
    add_column :cashiers, :confirmation_sent_at, :datetime
    add_column :cashiers, :unconfirmed_email, :string
    add_index :cashiers, :email, unique: true
    add_index :cashiers, :reset_password_token, unique: true
    add_index :cashiers, :confirmation_token, unique: true

    remove_column :cashiers, :password, :string
  end
end
