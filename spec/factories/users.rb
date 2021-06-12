FactoryBot.define do
  factory :user do
    nickname { 'yasu' }
    email { Faker::Internet.free_email }
    password { '1a' + Faker::Internet.password }
    password_confirmation { password }
    last_name_kanji { '安' }
    first_name_kanji { '広' }
    last_name_kana { 'ヤス' }
    first_name_kana { 'ヒロ' }
    birthday { Faker::Date.in_date_period }
  end
end
