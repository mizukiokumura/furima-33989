FactoryBot.define do
  factory :user do
    nickname { Faker::Name.middle_name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    jp_first_name { Gimei.first.kanji }
    jp_last_name { Gimei.last.kanji }
    jp_kana_first_name { Gimei.first.katakana }
    jp_kana_last_name { Gimei.last.katakana }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
