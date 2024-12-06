json.extract! order, :id, :total_amount, :payment_status, :user_id, :client_id, :created_at, :updated_at
json.url order_url(order, format: :json)
