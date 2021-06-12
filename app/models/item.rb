class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee_burden
  belongs_to :shipping_area
  belongs_to :day_to_ship

  belongs_to :user
  has_one :purchase_history
  has_one_attached :image
  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
    validates :price,
              numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                              message: 'is invalid. Price must be 300-9999999 yen and half-width characters' }
    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :category_id
      validates :status_id
      validates :shipping_fee_burden_id
      validates :shipping_area_id
      validates :day_to_ship_id
    end
  end
end
