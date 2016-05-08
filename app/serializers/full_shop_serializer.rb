class FullShopSerializer < ShopSerializer
  root "shop"
  has_one :user, as: :accountable, serializer: LocationUserSerializer
end
