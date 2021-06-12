FactoryBot.define do
  factory :purchase_history_order do
    postal_code { '000-0000' }
    shipping_area_id { rand(2..48) }
    municipality { '市' }
    address { 'あ1-1' }
    building_name { '家' }
    tel { '00000000000' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
