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
| year                  | integer | null: false   |
| month                 | integer | null: false   |
| day                   | integer | null: false   |


### Association

- has_many :items
- has_one :purchase_history

## itemsテーブル

| Column           | Type          | Option                   |
| ---------------- | ------------- | ------------------------ |
| image            | ActiveStorage | validates presence: true |
| item_name        | text          | null: false              |
| item_description | text          | null: false              |
| user_id          | references    | foreign_key: true        |
| category         | string        | null: false              |
| item_state       | string        | null: false              |
| item_price       | integer       | null: false              |


### Association

- belongs_to :user
- has_one :purchase_history

## street_addressテーブル

| Column        | Type     | Option        |
| ------------- | -------- | ------------- |
| Prefectures   | string   | null: false   |
| postal_code   | integer  | null: false   |
| municipality  | string   | null: false   |
| address       | string   | null: false   |
| building_name | string   |               |
| phone_number  | integer  | null: false   |



### Association
belongs_to :items



## purchase_historiesテーブル

| Column      | Type         | Option            |
| ----------- | ------------ | ----------------- |
| user_id     | references   | foreign_key: true |
| item_id     | references   | foreign_key: true |



### Association

- belongs_to :item
- belongs_to :user