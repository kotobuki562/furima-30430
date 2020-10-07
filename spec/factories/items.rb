FactoryBot.define do
  factory :item do
    name { 'ビデオカメラ' }
    text { 'ビデオカメラです' }
    category_id { '2' }
    state_id { '2' }
    delivery_charge_id { '2' }
    shipping_place_id { '2' }
    shipping_date_id { '2' }
    price { '3000' }
    association :user
  end
end

