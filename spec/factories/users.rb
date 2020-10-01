FactoryBot.define do
  factory :user do
    nickname { 'aaa' }
    email { 'aaa@aaa' }
    password { '111aaa' }
    password_confirmation { '111aaa' }
    family_name { '記事科'}
    first_name {'亜門'}
    family_name_furigana {'キジカ'}
    first_name_furigana {'アモン'}
    birthday {'1997-10-15'}
  end
end
