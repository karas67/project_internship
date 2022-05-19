json.extract! order, :id, :cashier_id, :date, :name, :amount, :created_at, :updated_at
json.url order_url(order, format: :json)
