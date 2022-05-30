class AddFildsForManagers < ActiveRecord::Migration[6.1]
  def change
    add_column :managers, :encrypted_password, :string, null: false, default: ""
    add_column :managers, :reset_password_token, :string
    add_column :managers, :reset_password_sent_at, :datetime
    add_column :managers, :remember_created_at, :datetime
    add_column :managers, :confirmation_token, :string
    add_column :managers, :confirmed_at, :datetime
    add_column :managers, :confirmation_sent_at, :datetime
    add_column :managers, :unconfirmed_email, :string
    add_index :managers, :email, unique: true
    add_index :managers, :reset_password_token, unique: true
    add_index :managers, :confirmation_token, unique: true

    remove_column :managers, :password, :string
  end
end
