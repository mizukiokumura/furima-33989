# furimaのテーブル設計

## usersテーブル

| Column                | Type    | Options       |
| --------------------- | ------- | ------------- |
| nickname              | string  | null: false   |
| email                 | string  | null: false   |
| password              | string  | null: false   |
| password_confirmation | string  | null: false   |
| jp_first_name         | string  | null: false   |
| jp_last_name          | string  | null: false   |
| jp_kana_first_name    | string  | null: false   |
| jp_kana_last_name     | string  | null: false   |

### Association

- has_many :items
- has_one :purchase_history

## itemsテーブル

| Column           | Type          | Option               |
| ---------------- | ------------- | -------------------- |
| item_name        | string        | null: false          |
| item_description | text          | null: false          |
| user             | references    | foreign_key: true    |
| item_state       | string        | null: false          |
| item_price       | integer       | null: false          |


### Association

- belongs_to :user
- has_one :purchase_history

## street_addressテーブル

| Column          | Type     | Option        |
| --------------- | -------- | ------------- |
| Prefecture_id   | integer  | null: false   |
| postal_code     | string   | null: false   |
| municipality    | string   | null: false   |
| address         | string   | null: false   |
| building_name   | string   |               |
| phone_number    | string   | null: false   |



### Association
- belongs_to :purchase_histories



## purchase_historiesテーブル

| Column      | Type         | Option            |
| ----------- | ------------ | ----------------- |
| user        | references   | foreign_key: true |
| item        | references   | foreign_key: true |



### Association

- belongs_to :item
- belongs_to :user