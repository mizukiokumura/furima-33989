FactoryBot.define do
  factory :purchase_street do
    prefecture_id { 3 }
    postal_code { "123-4567" }
    municipality {"東京都" }
    address { "武田" }
    building_name { "マンション" }
    phone_number {"08012345678"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
