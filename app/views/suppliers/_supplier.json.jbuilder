json.extract! supplier, :id, :name, :phone, :dir, :email, :city, :website, :created_at, :updated_at
json.url supplier_url(supplier, format: :json)
