class ShortLocationSerializer < ActiveModel::Serializer
  attributes :id, :latitude, :longitude, :user_id
end
