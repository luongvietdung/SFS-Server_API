class UserSerializer < ShortUserSerializer
  has_one :accountable, polymorphic: true, embed: :objects, include: true
end
