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

# 工夫したポイント

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

