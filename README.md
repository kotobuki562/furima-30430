# ユーザー管理機能

- users テーブル

| Column               | Type    | Options     |
| -------------------- | ------- | ----------- |
| nickname             | string  | null: false |
| email                | string  | nill: false |
| password             | string  | nill: false |
| family_name          | string  | nill: false |
| first_name           | string  | nill: false |
| family_name_furigana | string  | nill: false |
| first_name_furigana  | string  | nill: false |
| birthday             | integer | nill: false |

has_many: items
has_one: addresse

# 商品出品機能

- items テーブル

| Column             | Type          | Options      |
| ------------------ | ------------- | ------------ |
| name               | string        | nill: false  |
| category_id        | integer       | nill: false  |
| text               | text          | nill: false  |
| state_id           | integer       | nill: false  |
| delivery_charge_id | integer       | nill: false  |
| shipping_place_id  | integer       | nill: false  |
| shipping_date_id   | integer       | nill: false  |
| price              | integer       | nill: false  |
| ---------------    | ------------- | ------------ |
| user               | references    | nill: false  |
| purchase           | references    | nill: false  |

image...ActiveStorage で実装

belongs_to: user
has_one: addresse
has_one: purchase

# 商品購入機能-配送先情報-

- addresses テーブル

| Column           | Type          | Options      |
| ---------------- | ------------- | ------------ |
| post_coade       | string        | nill: false  |
| state            | integer       | nill: false  |
| prefectures      | integer       | nill: false  |
| municipality     | string        | nill: false  |
| address          | integer       | nill: false  |
| tellphone_number | string        | nill: false  |
| birthday         | date          | nill: false  |
| building         | string        |              |
| ---------------  | ------------- | ------------ |
| item             | references    | nill: false  |
| user             | references    | nill: false  |

belongs_to: item
belongs_to: user

# 商品購入機能-クレジット情報-

- purchases テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| credit_number   | string | nill: false |
| credit_deadline | string | nill: false |
| credit_pin      | string | nill: false |

belongs_to: item
