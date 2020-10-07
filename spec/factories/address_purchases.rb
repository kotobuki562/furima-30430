FactoryBot.define do
  factory :address_purchase do
    token { 'tok_abcdefghijk00000000000000000' }
    post_coade { '123-4567' }
    prefectures_id { 2 }
    municipality { '板橋区' }
    address { '秋下2-3-4' }
    tellphone_number { '09012345678' }
    association :user
    association :item
    association :purchase
  end
end
