# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    code { SecureRandom.hex(6) }
    name { Faker::Name.name }
    description { Faker::Lorem.paragraph }
    stock_quantity { Faker::Number.number(digits: 2) }
    unit_cost { Faker::Number.decimal(l_digits: 2) }
    unit_price { Faker::Number.decimal(l_digits: 2) }
    tax_amount { Faker::Number.decimal(l_digits: 2) }
    profit_margin { Faker::Number.decimal(l_digits: 2) }
    last_price_update { Faker::Date.backward(days: 14) }
    last_stock_update { Faker::Date.backward(days: 14) }
    supplier { create(:supplier) }
    category { create(:category) }
  end
end
