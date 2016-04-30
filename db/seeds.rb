# Create shippers
100.times do
  shipper = FactoryGirl.create :shipper
  FactoryGirl.create :location, user: shipper.user
end

# Create shops
100.times do
  shop = FactoryGirl.create :shop
  FactoryGirl.create :location, user: shop.user
end


