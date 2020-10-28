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

| Columm             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: ture |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birthday           | date    | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Columm              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| description         | text       | null: false                    |
| category_id         | integer    | null: false                    |
| status_id           | integer    | null: false                    |
| shipping_charges_id | integer    | null: false                    |
| shipping_area_id    | integer    | null: false                    |
| shipping_date_id    | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: ture |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Columm        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: ture |
| item          | references | null: false, foreign_key: ture |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Columm         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false, unique: ture      |
| prefectures_id | integer    | null: false, unique: ture      |
| municipality   | string     | null: false, unique: ture      |
| address        | string     | null: false, unique: ture      |
| building_name  | string     |                                |
| phone_number   | string     | null: false, unique: ture      |
| order          | references | null: false, foreign_key: ture |

### Association

- belongs_to :order