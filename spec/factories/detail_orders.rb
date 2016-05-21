FactoryGirl.define do
  factory :detail_order do
    code_checking{Faker::Code.ean}
    user{FactoryGirl.create(:shop).user}

    after(:build) do |detail_order|
      detail_order.code = DetailOrder.generate_code(detail_order.user)
      detail_order.phone_customer = Faker::PhoneNumber.cell_phone
      detail_order.phone_shipper = Faker::PhoneNumber.cell_phone
    end
  end
end
