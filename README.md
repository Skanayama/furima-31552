# README

# テーブル設計

## users テーブル

| Column           | Type   | Options                   |
| ---------------- | ------ | ------------------------- |
| nickname         | string | null: false               |
| email            | string | null: false, unique: true |
| password         | string | null: false               |
| family-name      | string | null: false               |
| first-name       | string | null: false               |
| furi-family-name | string | null: false               |
| furi-first-name  | string | null: false               |
| birthday         | string | null: false               |

### Association

- has_many :items
- has_many :buy-logs


## items テーブル

| Column       | Type       | Options     |
| -------------| ---------- | ----------- |
| seller       | string     | null: false |
| item-name    | string     | null: false |
| text         | text       | null: false |
| category     | string     | null: false |
| state        | string     | null: false |
| deliver-fee  | string     | null: false |
| deliver-area | string     | null: false |
| deliver-date | string     | null: false |
| price        | string     | null: false |
| user         | references | null: false |

### Association

- belongs_to :users
- has_one :buy-logs


## buy-logs テーブル

| Column        | Type       | Options                        |
| --------------| ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :addresses


## addresses テーブル

| Column       | Type       | Options     |
| -------------| ---------- | ----------- |
| post-number  | string     | null: false |
| prefecture   | string     | null: false |
| post-number  | string     | null: false |
| city         | string     | null: false |
| house-number | string     | null: false |
| building     | string     |             |
| phone-number | string     | null: false |
| buy-logs     | references | null: false |

### Association

- belongs_to :buy-logs

