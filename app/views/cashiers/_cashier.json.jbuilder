json.extract! cashier, :id, :first_name, :last_name, :email, :encrypted_password, :created_at, :updated_at
json.url cashier_url(cashier, format: :json)
