# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Columm          | Type    | Options                   |
| --------------- | ------- | ------------------------- |
| nickname        | string  | null: false               |
| email           | string  | null: false, unique: ture |
| password        | string  | null: false               |
| last_name       | string  | null: false               |
| first_name      | string  | null: false               |
| last_name_kana  | string  | null: false               |
| first_name_kana | string  | null: false               |
| birthday        | integer | null: false               |

### Association

- has_many :items
- has_many :order

## items テーブル

| Columm           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| image            | string     | null: false                    |
| name             | string     | null: false                    |
| description      | string     | null: false                    |
| category         | string     | null: false                    |
| status           | string     | null: false                    |
| shipping_charges | string     | null: false                    |
| shipping_area    | string     | null: false                    |
| shipping_date    | integer    | null: false                    |
| price            | integer    | null: false                    |
| user_id          | references | null: false, foreign_key: ture |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Columm        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| purchass_date | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: ture |
| item_id       | references | null: false, foreign_key: ture |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Columm       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | integer    | null: false, unique: ture      |
| prefectures  | string     | null: false, unique: ture      |
| municipality | string     | null: false, unique: ture      |
| address      | integer    | null: false, unique: ture      |
| phone_number | integer    | null: false, unique: ture      |
| order_id     | references | null: false, foreign_key: ture |

### Association

- belongs_to :order