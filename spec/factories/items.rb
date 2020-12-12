FactoryBot.define do
  factory :item do
    name                { Faker::Dessert.variety }
    description         { '新商品です！' }
    category_id         { 11 }
    status_id           { 2 }
    shipping_charge_id { 3 }
    shipping_area_id    { 14 }
    shipping_date_id    { 2 }
    price               { 600 }
    association :user
  end
end
