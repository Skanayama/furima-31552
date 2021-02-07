FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    first_name { '仮名' }
    family_name { '太郎' }
    furi_family_name { 'カナ' }
    furi_first_name { 'タロウ' }
    birthday { Faker::Date.between(from: '1930-01-01', to: '2016-12-31') }
    password { 'a00000' }
    password_confirmation { 'a00000' }
  end
end