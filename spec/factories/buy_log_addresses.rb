FactoryBot.define do
  factory :buy_log_address do
    postal_code { '123-4567' }
    deliver_area_id { 16 }
    city { '上越市高田' }
    house_number { '1-1' }
    building_name { '高田ハイツA棟' }
    phone_number { '09012341234' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
