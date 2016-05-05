class ShortShipperSerializer < ActiveModel::Serializer
  attributes :id, :money, :fee, :name, :address
end
