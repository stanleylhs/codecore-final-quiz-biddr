FactoryGirl.define do
  factory :auction do
    title { Faker::Commerce.product_name }
    details { Faker::Lorem.sentence }
    ends_on Time.now + 10.days
    reserve_price {rand(100)}
  end
end
