# ユーザー管理機能

- users テーブル

| Column   | Type    | Options     |
| -------- | ------- | ----------- |
| nickname | string  | null: false |
| email    | string  | nill: false |
| password | string  | nill: false |
| name     | string  | nill: false |
| birthday | integer | nill: false |

item...has_many
purchases...has_one

# 商品出品機能

- items テーブル

| Column          | Type          | Options      |
| --------------- | ------------- | ------------ |
| image           | ActiveStorage | null: false  |
| name            | string        | nill: false  |
| category        | string        | nill: false  |
| text            | text          | nill: false  |
| state           | string        | nill: false  |
| delivery_charge | string        | nill: false  |
| shipping_place  | string        | nill: false  |
| shipping_date   | integer       | nill: false  |
| price           | integer       | nill: false  |
| --------------- | ------------- | ------------ |
| user            | references    | nill: false  |
| purchases       | references    | nill: false  |

image...ActiveStorage で実装

name...string 型 (NOT NULL)
category...string 型 (NOT NULL)
text(説明文)...text 型 (NOT NULL)
state(商品状態)...string 型 (NOT NULL)
delivery_charge(配送料)...string 型 (NOT NULL)
shipping_place(発送地)...string 型 (NOT NULL)
shipping_date(発送期日)...integer 型 (NOT NULL)
price(価格)...integer 型 (NOT NULL)

user...references 型 belongs_to
purchases...references 型 has_one

# 商品購入機能

- purchases テーブル

| Column           | Type          | Options      |
| ---------------- | ------------- | ------------ |
| credit_number    | integer       | null: false  |
| credit_deadline  | integer       | nill: false  |
| credit_pin       | integer       | nill: false  |
| post_coade       | integer       | nill: false  |
| state            | string        | nill: false  |
| prefectures      | string        | nill: false  |
| municipality     | string        | nill: false  |
| address          | integer       | nill: false  |
| tellphone_number | integer       | nill: false  |
| building         | string        | nill: false  |
| ---------------  | ------------- | ------------ |
| item             | references    | nill: false  |
| user             | references    | nill: false  |

credit_number...integer 型 (NOT NULL)
credit_deadline...integer 型 (NOT NULL)
credit_pin...integer 型 (NOT NULL)
post_coade...integer 型 (NOT NULL)
prefectures(都道府県)...string 型 (NOT NULL)
municipality(市町村)...string 型 (NOT NULL)
address(番地)...string 型 (NOT NULL)
building(建物名)...string 型 (任意)
tellphone_number...integer 型 (NOT NULL)

item...references 型 belongs_to
user...references 型 belongs_to
