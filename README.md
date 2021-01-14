# README

# 概要

テックキャンプの最終課題にて、フリーマーケットのアプリケーションを作成しました。ユーザーを登録すると商品を出品できるようになります。自身が出品した商品は、編集と削除をすることができます。他のユーザーが出品した商品は、クレジットカードを用いて購入することができます。

# 本番環境

https://furima-29368.herokuapp.com/

- ID/Pass
  - ID: tera
  - Pass: 0502

ログイン情報(テスト用)

- 出品者用
  - メールアドレス: sample001@yahoo.co.jp
  - パスワード: sample001

- 購入者用
  - メールアドレス: sample002@yahoo.co.jp
  - パスワード: sample002

- 購入用カード情報
  - 番号: 4242424242424242
  - 期限: 1/23
  - セキュリティコード: 123


# DEMO

## ユーザー管理機能

### トップページ

#### No1
<img width="1426" alt="top-page-1" src="https://user-images.githubusercontent.com/69949838/104540798-8ea71e00-5663-11eb-8ee1-9d707078c5ca.png">

#### No2
<img width="1420" alt="top-page-2" src="https://user-images.githubusercontent.com/69949838/104540820-9a92e000-5663-11eb-96aa-0d1b53b29dc2.png">

### 新規登録画面

#### No1
<img width="1422" alt="user-sign-1" src="https://user-images.githubusercontent.com/69949838/104540839-aaaabf80-5663-11eb-8461-d07321247e34.png">

#### No2
<img width="1416" alt="user-sign-2" src="https://user-images.githubusercontent.com/69949838/104540863-b5fdeb00-5663-11eb-97a0-f1f71597d972.png">

- 新規登録方法
  - トップページから新規登録ボタン押下→ユーザー情報入力→ユーザー登録完了

## 商品出品機能

### 出品画面

#### No1
<img width="1419" alt="sell-item-1" src="https://user-images.githubusercontent.com/69949838/104540880-c1e9ad00-5663-11eb-9489-6fddf53bbbe3.png">

#### No2
<img width="1424" alt="sell-item-2" src="https://user-images.githubusercontent.com/69949838/104540892-c9a95180-5663-11eb-90b8-7e9d2d7f7445.png">

- 商品出品方法
  - テストアカウントでログイン→トップページから出品ボタン押下→商品情報入力→商品出品

## 商品購入機能

### 購入画面

#### No1
<img width="1423" alt="buy-item-1" src="https://user-images.githubusercontent.com/69949838/104540914-d4fc7d00-5663-11eb-8ef3-0a010bf968b6.png">

#### No2
<img width="1425" alt="buy-item-2" src="https://user-images.githubusercontent.com/69949838/104540918-db8af480-5663-11eb-9a7c-5dbf7043fe19.png">

- 商品購入方法
  - テストアカウントでログイン→トップページから商品検索→商品選択→商品購入

# 工夫したポイント

- スピードを意識した開発
  - 開発期限の４週間に対して、２週間を目標にして開発を実施しました。目標通りの2週間とはなりませんでしたが、3週間で実装を完了させることができました。各機能実装に期日を儲け、1日4度の進捗確認を行うことで、期日管理をしました。

- 優先順位を決めた開発
  - この機能の実装を行わなければ、この機能を実装をすることが出来ないなど、実装の順番も考慮する必要があったので、予め実装に優先順位をつけて実装を進めて行きました。

- active_hashの利用
  - 都道府県や商品カテゴリー入力の際に、active_hash を実装し、入力をしなくても選択式となるように工夫しました。

# 苦労した点

- データベース設計
  - 1人のユーザーが商品の出品、購入という多機能なアプリケーションの開発が自身にとっては初めてでした。そのため、どのようなテーブルがあり、テーブル同士がどのような関係性なのかイメージしづらく、データベース設計に苦労しました。開発を進めていく中で必要な、もしくは不要なテーブル、カラムに気がつきました。各機能の追加前後にその都度DB設計について見直しを行ったりすることで不要な作業を減らせたと思います。

- バリデーション、単体、結合テストの実装
  - 各モデルに対する、正規表現を用いたバリデーション設定、テストコードの実装に苦労しました。例えば、ユーザー登録の際に入力するメールアドレスにメールアドレスに＠を含めるや半角、全角にする必要があることなどです。また設定したバリデーションに合わせて、テストコードを過不足なく記述するのに苦労しました。


# 使用技術(開発環境)

## バックエンド

Ruby,Ruby on Rails

## フロントエンド

HTML,CSS,JavaScript,jQuery

## データベース

MySQL SequelPro

## インフラ

AWS(S3)

## Webサーバ (本番環境)

nginx

## アプリケーションサーバ (本番環境)

unicorn

## ソース管理

GitHub,GitHubDesktop

## テスト

RSpec

## エディタ

VSCode

# DB設計

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
| birth              | date   | null: false |

### Association
- has_many :orders
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

## addressテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| order         | references | null: false, foreign_key: true |
| postal_code   | string     | null: false                    |    
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |

### Association
-belongs_to  :order

## items テーブル

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
| delivery_day_id    | integer     | null: false                    |

### Association
- has_one    :order
- belongs_to  :user

