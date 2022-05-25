class AddFildsForManagers < ActiveRecord::Migration[6.1]
  def change
    add_column :managers, :encrypted_password, :string, null: false, default: ""
    remove_column :managers, :password, :string
  end
end
