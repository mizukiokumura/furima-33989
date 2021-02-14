FactoryBot.define do
  factory :street_address do
    association :purchase_history
    prefecture_id { 3 }
    postal_code { "123-4567"}
    municipality {"東京都"}
    address { "武田"}
    building_name { "マンション"}
    phone_number {"08012345678"}
  end
end
