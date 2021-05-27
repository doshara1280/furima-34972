class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  with_options presence: true do
    validates :nickname
    validates :birthday

    with_options format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/ } do
      validates :last_name_kanji
      validates :first_name_kanji
    end

    with_options format: { with: /\A[ァ-ン]+\z/ } do
      validates :last_name_kana
      validates :first_name_kana
    end
  end
end
