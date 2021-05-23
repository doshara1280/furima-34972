class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee_burden
  belongs_to :shipping_area
  belongs_to :day_to_ship

  belongs_to :user
  has_one_attached :image
  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
    validates :price, numericality: { in: 300..9_999_999 }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :shipping_fee_burden_id
      validates :shipping_area_id
      validates :day_to_ship_id
    end
  end
end
