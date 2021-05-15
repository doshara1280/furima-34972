# テーブル設計

## usersテーブル
| column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name_kanji    | string | null: false               |
| first_name_kanji   | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many :items
- has_many :purchase_histories


## itemsテーブル(image除く)
| column                 | Type       | Options                        |
| ---------------------- | -----------| ------------------------------ |
| name                   | string     | null: false                    |
| description            | text       | null: false                    |
| category_id            | integer    | null: false                    |
| status_id              | integer    | null: false                    |
| shipping_fee_burden_id | integer    | null: false                    |
| shipping_area_id       | integer    | null: false                    |
| day_to_ship_id         | integer    | null: false                    |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association
- has_one :purchase_history
- belongs_to :user


## street_addressesテーブル
| column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| shipping_area_id | integer    | null: false                    |
| municipality     | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| tel              | string     | null: false                    |
| purchase_history | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase_history


## purchase_historiesテーブル
| column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- has_one :street_address
- belongs_to :user
- belongs_to :item