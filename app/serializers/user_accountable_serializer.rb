class UserAccountableSerializer < ShortUserSerializer
  has_one :location, serializer: ShortLocationSerializer
end
