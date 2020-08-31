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

| Column   | Type   | Options     |
| ----------| ------ | ----------- |
| first_name | string | null: false |
| last_name | string | null: false |
| email    | string | null: false |
| encrypted_password | string | null: false |


### Association

- has_many :items
- has_many :comments
- has_one :profile


## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| title   | string | null: false |
| image  | text | null: false |
| description-item | text | null: false |
| price   | integer | null: false |
| user  | references | null: false, foreign_key: true |

### Association

- has_many :comments
- has_one :purchase
- references: user

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| comment | text | null: false|
| user   | references | null: false, foreign_key: true |
| item  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- references: user
- references: item

## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |                              
| item_id   | integer | null: false |
| user_id   | integer | null: false |

### Association

- belongs_to :item
- belongs_to :user

## profiles テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |                              
| birth-date    | integer | null: false |
| user_id   | integer | null: false  |

### Association

- belongs_to :user

## shipments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |                              
| postal  | string | null: false |
| city  | string | null: false |
| house-number  | string | null: false |
| building  | string |  |
| phone-number  | string | null: false |
| purchase_id | integer | null: false |


### Association

- belongs_to :purchase
