json.extract! supplier, :id, :name, :phone, :address, :email, :city, :website, :created_at, :updated_at
json.url supplier_url(supplier, format: :json)
