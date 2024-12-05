json.extract! transaction, :id, :amount, :transaction_type, :source_account_id, :destination_account_id, :description, :timestamp, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
