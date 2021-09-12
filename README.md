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

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| profile            | string | null: false |
| class              | string | null: false |
| director           | string | null: false |


### Association

- has_many :prototypes
- has_many :comments

## prototypes テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| prototype_name   | string     | null: false |
| catch_copy       | string     | null: false |
| concept          | string     | null: false |
| image            | string     | null: false |
| user_id          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| content      | string     |                                |
| user         | references | null: false, foreign_key: true |
| prototype    | references | null: false, foreign_key: true |

### Association

- belongs_to :prototype
- belongs_to :user
