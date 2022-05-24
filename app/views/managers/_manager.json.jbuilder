json.extract! manager, :id, :first_name, :last_name, :email, :password, :created_at, :updated_at
json.url manager_url(manager, format: :json)
