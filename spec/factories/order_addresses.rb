FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture { Faker::Number.within(range: 1..47) }
    city { '横浜市緑区' }
    house_number { '青山1-1-1' }
    phone_number { '09012345678' }
    token { 'pk_test_1234abcd' }
  end
end
