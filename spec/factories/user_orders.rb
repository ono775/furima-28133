FactoryBot.define do
  factory :user_order do
    postal_code    { '123-4567' }
    prefectures_id { 14 }
    municipality   { '新宿区' }
    address        { '1-2' }
    phone_number   { 12_345_678_910 }
    user_id { 1 }
    item_id { 2 }
  end
end
