FactoryBot.define do
  factory :item do
    association :user
    title { '商品' }
    description { '商品説明' }
    price { 2000 }
    category_id { 2 }
    condition_id { 2 }
    ship_fee_id { 2 }
    region_id { 2 }
    ship_date_id { 2 }
  end
end
