FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password }
    password_confirmation { password }
    last_name_kanji { Faker::Japanese::Name.last_name }
    first_name_kanji { Faker::Japanese::Name.first_name }
    last_name_kana { Faker::Japanese::Name.last_name.yomi }
    first_name_kana { Faker::Japanese::Name.first_name.yomi }
    birthday { Faker::Date.in_date_period }
  end
end
