FactoryGirl.define do
  factory :location do
    latitude{Faker::Address.latitude}
    longitude{Faker::Address.longitude}
    user{FactoryGirl.create :user}
  end
end
