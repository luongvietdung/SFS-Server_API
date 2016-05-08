class LocationUserSerializer < ShortUserSerializer
  has_one :location, serializer: ShortLocationSerializer
end
