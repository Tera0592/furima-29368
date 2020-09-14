# README
# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birth_year         | date   | null: false |
| birth_month        | date   | null: false |
| birth_dar          | date   | null: false |

### Association
- has_one :orders
- has_many :comments
- has_many :items

## orders テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |                       


### Association
- belongs_to :user
- belongs_to :item
- has_one    :address

### addressテーブル

| order         | references | null: false, foreign_key: true |
| post_number   | string     | null: false                    |    
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     |                                |
| building_name | string     | null: false                    |
| phone_number  | string     | null: false                    |

### Association
has_one  :order

### items テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| user               | references  | null: false, foreign_key: true |
| name               | string      | null: false                    |
| introduction       | text        | null: false                    |
| price              | integer     | null: false                    |
| condition_id       | integer     | null: false                    |
| category_id        | integer     | null: false                    |
| delivery_fee _id   | integer     | null: false                    |
| delivery_place_id  | integer     | null: false                    |
| delivery_date_id   | integer     | null: false                    |

### Association
- has_many   :comments
- has_one    :order

### comments テーブル
| Column         | Type        | Options                        |
| -------------- | ----------- | ------------------------------ |
| user           | references  | null: false, foreign_key: true |
| item           | references  | null: false, foreign_key: true |
| comment        | text        | null: false                    |
| created_at     | timestamp   | null: false                    |

### Association
- belongs_to   :items