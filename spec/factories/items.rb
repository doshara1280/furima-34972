FactoryBot.define do
  factory :item do
    name { 'test' }
    description { Faker::Lorem.sentence }
    category_id { rand(2..11) }
    status_id { rand(2..7) }
    shipping_fee_burden_id { rand(2..3) }
    shipping_area_id { rand(2..48) }
    day_to_ship_id { rand(2..4) }
    price { rand(300..9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/star.png'), filename: 'star.png')
    end
  end
end
