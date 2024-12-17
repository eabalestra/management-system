json.extract! order_payment, :id, :amount, :payment_method, :paid_at, :order_id, :created_at, :updated_at
json.url order_payment_url(order_payment, format: :json)
