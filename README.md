# README

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| furi_family_name   | string | null: false               |
| furi_first_name    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :buy_logs


## items テーブル

| Column          | Type       | Options     |
| ----------------| ---------- | ----------- |
| name            | string     | null: false |
| text            | text       | null: false |
| category_id     | integer    | null: false |
| state_id        | integer    | null: false |
| deliver_fee_id  | integer    | null: false |
| deliver_area_id | integer    | null: false |
| deliver_date_id | integer    | null: false |
| price           | integer    | null: false |
| user            | references | null: false |

### Association

- belongs_to :user
- has_one :buy_log


## buy_logs テーブル

| Column        | Type       | Options                        |
| --------------| ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Column        | Type       | Options     |
| --------------| ---------- | ----------- |
| postal_code   | string     | null: false |
| prefecture    | integer    | null: false |
| city          | string     | null: false |
| house_number  | string     | null: false |
| building_name | string     |             |
| phone_number  | string     | null: false |
| buy_log       | references | null: false |

### Association

- belongs_to :buy_log

