FactoryGirl.define do
  factory :shipper do
    money{rand(1000)}
    fee{rand(1000)}
    name{Faker::Name.name}
    address{Faker::Address.street_address}

     after(:create) do |shipper|
      create(:user, accountable: shipper)
     end
  end
end
