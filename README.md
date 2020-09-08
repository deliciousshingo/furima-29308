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
| first_name | string | null: false |
| last_name | string | null: false |
| first_name_reading | string | null: false |
| last_name_reading | string | null: false |
| email    | string | null: false |
| encrypted_password | string | null: false |
| birth_date | date | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :orders


## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| title   | string | null: false |
| description | text | null: false |
| price   | integer | null: false |
| category_id   | integer | null: false |	
| condition_id | integer | null: false |	
| ship_fee_id  | integer | null: false |	
| region_id  | integer | null: false |	
| ship_date_id | integer | null: false |
| user  | references | null: false, foreign_key: true |

### Association

- has_many :comments
- has_one :order
- belongs_to :user

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| comment | text | null: false|
| user_id   | references | null: false, foreign_key: true |
| item_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## orders テーブル

| Column  | Type       | Options      |
| ------- | ---------- | -------------|                              
| item_id   | integer | null: false, foreign_key: true |
| user_id   | integer | null: false, foreign_key: true |

### Association

- has_one :shipment
- belongs_to :item
- belongs_to :user

## shipments テーブル

| Column  | Type       | Options            |
| ------- | ---------- | ------------------ |                              
| postal  | string | null: false |
| prefecture_id | integer | null: false |
| city  | string | null: false |
| house_number  | string | null: false |
| building  | string | |
| phone_number  | string | null: false |
| order_id | integer | null: false, foreign_key: true |


### Association

- belongs_to :order
