FactoryBot.define do
  factory :item do
    name { Gimei.name }
    item_description { Gimei.address }
    category_id { Faker::Number.within(range: 2..11) }
    state_id { Faker::Number.within(range: 2..7) }
    delivery_fee_burden_id { Faker::Number.within(range: 2..3) }
    shipment_source_prefecture_id { Faker::Number.within(range: 2..48) }
    days_to_ship_id { Faker::Number.within(range: 2..4) }
    price { Faker::Number.number(digits: 4) }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
