# furimaのテーブル設計

## usersテーブル

| Column              | Type    | Options                  |
| ------------------- | ------- | ------------------------ |
| nickname            | string  | null: false              |
| email               | string  | null: false, unique:true |
| encrypted_password  | string  | null: false              |
| jp_first_name       | string  | null: false              |
| jp_last_name        | string  | null: false              |
| jp_kana_first_name  | string  | null: false              |
| jp_kana_last_name   | string  | null: false              |
| birthday            | date    | null: false              |


### Association

- has_many :items
- has_many :purchase_histories

## itemsテーブル

| Column                        | Type          | Option               |
| ----------------------------- | ------------- | -------------------- |
| name                          | string        | null: false          |
| item_description              | text          | null: false          |
| user                          | references    | foreign_key: true    |
| price                         | integer       | null: false          |
| category_id                   | integer       | null: false          |
| state_id                      | integer       | null: false          |
| delivery_fee_burden_id        | integer       | null: false          |
| shipment_source_prefecture_id | integer       | null: false          |
| days_to_ship_id               | integer       | null: false          |

### Association

- belongs_to :user
- has_one :purchase_history

## street_addressテーブル

| Column           | Type       | Option            |
| ---------------- | ---------- | ----------------- |
| prefecture_id    | integer    | null: false       |
| postal_code      | string     | null: false       |
| municipality     | string     | null: false       |
| address          | string     | null: false       |
| building_name    | string     |                   |
| phone_number     | string     | null: false       |
| purchase_history | references | foreign_key: true |


### Association
- belongs_to :purchase_history


## purchase_historiesテーブル

| Column      | Type         | Option            |
| ----------- | ------------ | ----------------- |
| user        | references   | foreign_key: true |
| item        | references   | foreign_key: true |



### Association

- belongs_to :item
- belongs_to :user
- has_one :street_address