FactoryBot.define do
  factory :item do
    name {Faker::Book.title}
    introduction {Faker::Lorem.sentence}
    price {Faker::Number.within(range: 300..9999999)}
    condition_id {Faker::Number.within(range: 2..7)}
    category_id {Faker::Number.within(range: 2..10)}
    fee_id {Faker::Number.within(range: 2..3)}
    place_id {Faker::Number.within(range: 2..48)}
    day_id {Faker::Number.within(range: 2..4)}
    association :user
  end
end