class UserSerializer < ShortUserSerializer
  has_one :accountable, polymorphic: true, embed: :objects
  # has_one :location, serializer: ShortLocationSerializer
end
