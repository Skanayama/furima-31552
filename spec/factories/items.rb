FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    text { Faker::Lorem.sentence }
    category_id { rand(2..11) }
    state_id { rand(2..7) }
    deliver_fee_id { rand(2..3) }
    deliver_area_id { rand(2..48) }
    deliver_date_id { rand(2..4) }
    price { rand(300..9999999) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
