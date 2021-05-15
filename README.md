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
- has_many :purchases


## itemsテーブル(image除く)
| column              | Type       | Options                        |
| ------------------- | -----------| ------------------------------ |
| item_name           | string     | null: false                    |
| item_description    | text       | null: false                    |
| category            | integer    | null: false                    |
| item_status         | integer    | null: false                    |
| shipping_fee_burden | integer    | null: false                    |
| shipping_area       | integer    | null: false                    |
| day_to_ship         | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association
- has_one :purchase
- belongs_to :user


## purchasesテーブル
| column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| postal_code         | string     | null: false                    |
| prefectures         | integer    | null: false                    |
| municipality        | string     | null: false                    |
| address             | string     | null: false                    |
| building_name       | string     |                                |
| tel                 | string     | null: false                    |
| purchase_history_id | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :purchase_history


## purchase_historysテーブル
| column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- has_one :purchase