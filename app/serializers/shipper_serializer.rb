class ShipperSerializer < ShortShipperSerializer
  has_one :user, as: :accountable, serializer: ShortUserSerializer
end
