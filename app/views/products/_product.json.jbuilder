json.extract! product, :id, :code, :name, :description, :image_url, :stock_quantity, :last_price_update, :last_stock_update, :unit_cost, :unit_price, :tax_amount, :profit_margin, :supplier_id, :created_at, :updated_at
json.url product_url(product, format: :json)
