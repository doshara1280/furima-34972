class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :last_name_kanji, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_kanji, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ン]/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ン]/ }
  validates :birthday, presence: true
end
