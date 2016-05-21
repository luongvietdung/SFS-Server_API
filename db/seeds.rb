# Create shippers
10.times do
  shipper = FactoryGirl.create :shipper
end

# Create shops
10.times do
  shop = FactoryGirl.create :shop
end

10.times do
  FactoryGirl.create :detail_order
end


