class FullShipperSerializer < ShipperSerializer
  root "shipper"
  has_one :user, as: :accountable, serializer: LocationUserSerializer
end
