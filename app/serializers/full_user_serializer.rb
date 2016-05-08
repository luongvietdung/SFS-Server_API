class FullUserSerializer < UserSerializer
  root "user"
  has_one :location, serializer: ShortLocationSerializer
end
