FactoryGirl.define do
  factory :user do
    phone{rand(10**9..10**10)}
    status{[true, false].sample}
    password{"12345678"}
    password_confirmation{"12345678"}
    accountable{|a| a.association([:shipper, :shop].sample)}
    latitude{Faker::Address.latitude}
    longitude{Faker::Address.longitude}
  end
end
