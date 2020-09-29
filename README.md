# ユーザー管理機能

- users テーブル

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| nickname             | string | null: false |
| email                | string | nill: false |
| password             | string | nill: false |
| family_name          | string | nill: false |
| first_name           | string | nill: false |
| family_name_furigana | string | nill: false |
| first_name_furigana  | string | nill: false |
| birthday             | date   | nill: false |

has_many: items
has_many: purchases

# 商品出品機能

- items テーブル

| Column             | Type          | Options                       |
| ------------------ | ------------- | ----------------------------- |
| name               | string        | nill: false                   |
| category_id        | integer       | nill: false                   |
| text               | text          | nill: false                   |
| state_id           | integer       | nill: false                   |
| delivery_charge_id | integer       | nill: false                   |
| shipping_place_id  | integer       | nill: false                   |
| shipping_date_id   | integer       | nill: false                   |
| price              | integer       | nill: false                   |
| ---------------    | ------------- | ------------                  |
| user_id            | references    | nill: false,foreign_key: true |

image...ActiveStorage で実装

belongs_to: user

# 商品購入機能-配送先情報-

- addresses テーブル

| Column              | Type          | Options                        |
| ------------------- | ------------- | ------------------------------ |
| post_coade_id       | string        | nill: false                    |
| prefectures_id      | integer       | nill: false                    |
| municipality_id     | string        | nill: false                    |
| address_id          | integer       | nill: false                    |
| tellphone_number_id | string        | nill: false                    |
| building_id         | string        |                                |
| ---------------     | ------------- | ------------                   |
| purchase_id         | references    | nill: false, foreign_key: true |

belongs_to :purchase

# 商品購入機能-クレジット情報-

- purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | nill: false, foreign_key: true |
| item_id | references | nill: false, foreign_key: true |

belongs_to: user
has_one: addresse
