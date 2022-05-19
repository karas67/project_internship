json.extract! order_details, :id, :order_id, :detail_id, :amount, :quantity, :created_at, :updated_at
json.url order_details_url(order_details, format: :json)
