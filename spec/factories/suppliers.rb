FactoryBot.define do
  factory :supplier do
    name { Faker::Company.name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.cell_phone }
    address { Faker::Address.full_address }
    city { Faker::Address.city }
    website { Faker::Internet.url }
  end
end