FactoryBot.define do
  factory :order_shipment do
    postal { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    house_number { '1-1' }
    building { '東京ハイツ' }
    phone_number { '09011112222' }
    token { '1111111111111111' }
  end
end
