# README
# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association
- has_one :profiles
- has_one :credits
- has_one :orders
- has_many :comments
- has_many :items

## profiles テーブル
| Column             | Type   | Options     |
| -------------      | ------ | ----------- |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birth_year         | date   | null: false |
| birth_month        | date   | null: false |
| birth_dar          | date   | null: false |

### Association
- belongs_to :user

## orders テーブル
| Column       | Type        | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| post_number   | integer(7) | null: false                    |                          
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | integer    | null: false                    |

### Association
- belongs_to :user

### credits テーブル
| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user              | references | null: false, foreign_key: true |
| card_number       | integer    | null: false, unique: true      |
| expiration_year   | integer    | null: false                    |
| expiration_month  | integer    | null: false                    |
| security_code     | integer    | null: false                    |

### Association
- belongs_to :user

### items テーブル

| Column         | Type        | Options                        |
| -------------- | ----------- | ------------------------------ |
| user           | references  | null: false, foreign_key: true |
| name           | string      | null: false                    |
| introduction   | text        | null: false                    |
| price          | integer     | null: false                    |
| condition      | string      | null: false                    |
| delivery_fee   | integer     | null: false                    |
| delivery_place | string      | null: false                    |
| delivery_date  | date        | null: false                    |

### Association
- belongs_to :category
- has_one    :image
- has_many   :comments

### categories テーブル
| Column         | Type        | Options                        |
| -------------- | ----------- | ------------------------------ |
| item           | references  | null: false, foreign_key: true |
| name           | string      | null: false                    |

### Association
- has_many   :items

### images テーブル
| Column         | Type        | Options                        |
| -------------- | ----------- | ------------------------------ |
| item           | references  | null: false, foreign_key: true |
| utl            | string      | null: false                    |

### Association
- has_one   :items

### comments テーブル
| Column         | Type        | Options                        |
| -------------- | ----------- | ------------------------------ |
| user           | references  | null: false, foreign_key: true |
| item           | references  | null: false, foreign_key: true |
| comment        | text        | null: false                    |
| created_at     | timestamp   | null: false                    |

### Association
- belongs_to   :items