class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :nickname, presence: true
  # validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  # validates :last_name_kanji, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/ }
  # validates :first_name_kanji, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/ }
  # validates :last_name_kana, presence: true, format: { with: /\A[ァ-ン]+\z/ }
  # validates :first_name_kana, presence: true, format: { with: /\A[ァ-ン]+\z/ }
  # validates :birthday, presence: true
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
