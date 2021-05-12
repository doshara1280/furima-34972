# テーブル設計

## usersテーブル
| column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| name_kanji | string | null: false |
| name_kana  | string | null: false |
| birthday   | date   | null: false |

### Association
- has_many :items
- has_many :purchases


## itemsテーブル(image除く)
| column              | Type       | Options                        |
| ------------------- | -----------| ------------------------------ |
| item_name           | string     | null: false                    |
| item_description    | text       | null: false                    |
| category            | string     | null: false                    |
| item_status         | string     | null: false                    |
| shipping_fee_burden | string     | null: false                    |
| shipping_area       | string     | null: false                    |
| day_to_ship         | string     | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association
- has_one :purchase
- belongs_to :user


## purchasesテーブル
| column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| card_information | integer    | null: false                    |
| expiration_date  | date       | null: false                    |
| cvc              | integer    | null: false                    |
| postal_code      | string     | null: false                    |
| prefectures      | string     | null: false                    |
| municipality     | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | integer    |                                |
| tel              | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |
| items            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item