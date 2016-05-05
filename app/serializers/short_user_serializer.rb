class ShortUserSerializer < ActiveModel::Serializer
  attributes :id, :phone, :status
  has_one :location, serializer: ShortLocationSerializer
end
