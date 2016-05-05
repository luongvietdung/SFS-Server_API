class ShopSerializer < ShortShopSerializer
  has_one :user, as: :accountable, serializer: ShortUserSerializer
end
