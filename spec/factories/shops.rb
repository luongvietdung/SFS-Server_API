FactoryGirl.define do
  factory :shop do
    money{rand(1000)}
    product_name{Faker::Commerce.product_name}
    name{Faker::Name.name}
    address{Faker::Address.street_address}

    after(:create) do |shop|
      create(:user, accountable: shop)
    end
  end
end
