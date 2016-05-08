class FullShopSerializer < ShopSerializer
  has_one :user, as: :accountable, serializer: UserAccountableSerializer
end
