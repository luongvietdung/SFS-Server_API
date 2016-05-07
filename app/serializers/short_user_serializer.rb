class ShortUserSerializer < ActiveModel::Serializer
  attributes :id, :phone, :status, :uid
  has_one :location, serializer: ShortLocationSerializer
end
