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
| nickname | string | null: false |
| name | string | null: false |
| name-reading | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| encrypted_password | string | null: false |


### Association

- has_many :items
- has_many :comments
- has_one :profile


## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| titile   | string | null: false |
| image  | text | null: false |
| item-comment  | text | null: false |
| price   | integer | null: false |
| item-category   | string | null: false |
| item-condition| string | null: false |
| ship-fee  | string | null: false |
| region  | string | null: false |
| ship-date | string | null: false |
| user  | references | null: false, foreign_key: true |

### Association

- has_many :comments
- has_one :purchase
- references: user_id

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| comment | text | null: false|
| user   | references | null: false, foreign_key: true |
| item  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- references: user_id
- references: item_id

## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |                              
| item   | integer | null: false |

### Association

- belongs_to :item

## profiles テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |                              
| birth-date    | integer | null: false |
| user   | integer | null: false  |

### Association

- belongs_to :user

## shipments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |                              
| postal  | integer | null: false |
| prefecture  | string | null: false |
| city  | string | null: false |
| house-number  | string | null: false |
| building  | string |  |
| phone-number  | integer | null: false |


### Association

- belongs_to :purchase
