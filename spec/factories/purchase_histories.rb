FactoryBot.define do
  factory :purchase_history do
    association :item
    association :user
    user_id {user.id}
    item_id {item.id}
  end
end
