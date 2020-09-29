# ユーザー管理機能

- users テーブル

nickname...string 型 (NOT NULL)
email...string 型 (NOT NULL)
password...string 型 (NOT NULL)

name...string 型 (NOT NULL)
birthday...integer 型 (NOT NULL)

# 商品出品機能

- items テーブル

image...ActiveStorage で実装

name...string 型 (NOT NULL)
category...string 型 (NOT NULL)
text(説明文)...text 型 (NOT NULL)
state(商品状態)...string 型 (NOT NULL)
delivery_charge(配送料)...string 型 (NOT NULL)
shipping_place(配送先)...string 型 (NOT NULL)
shipping_date(発送期日)...string 型 (NOT NULL)
price(価格)...integer 型 (NOT NULL)

user...references 型
purchases...references 型

# 商品購入機能

- purchases テーブル

credit_number...integer 型 (NOT NULL)
credit_deadline...integer 型 (NOT NULL)
credit_pin...integer 型 (NOT NULL)
post_coade...integer 型 (NOT NULL)
prefectures(都道府県)...string 型 (NOT NULL)
municipality(市町村)...string 型 (NOT NULL)
address(番地)...string 型 (NOT NULL)
building(建物名)...string 型 (任意)
tellphone_number...integer 型 (NOT NULL)

item...references 型
