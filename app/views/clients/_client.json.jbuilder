json.extract! client, :id, :name, :phone, :address, :email, :city, :created_at, :updated_at
json.url client_url(client, format: :json)
